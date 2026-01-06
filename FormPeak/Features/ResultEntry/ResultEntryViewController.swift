import UIKit

final class ResultEntryViewController: UIViewController {
    
    // MARK: - UI
    private let scrollView = ScrollingStackView(
        axis: .vertical,
        spacing: Layout.spaceM,
        contentInsets: UIEdgeInsets(top: Layout.spaceM, left: 0, bottom: Layout.spaceM, right: 0)
    )
    
    private lazy var exerciseSelectionButton = FormFieldFactory.picker(
        title: "Упражнение",
        valueTitle: "Становая тяга",
        icon: Icons.barbell,
        chevron: true,
        action: {
            print("exerciseSelectionButton")
        }
    )
    
    private lazy var exerciseMainStackView = StackViewFactory.makeStackView(
        spacing: Layout.spaceS
    )

    private lazy var exerciseDataStackView = StackViewFactory.makeStackView(
        axis: .horizontal,
        spacing: Layout.spaceS,
        distribution: .fillEqually
    )
    
    private lazy var weightInputField = FormFieldFactory.textInput(
        title: "Вес, кг",
        placeholder: "Рекорд",
        icon: Icons.weight
    )
    
    private lazy var repsInputField = FormFieldFactory.textInput(
        title: "Повторы",
        placeholder: "Кол-во",
        icon: Icons.repeatIcon
    )
    
    private lazy var datePickerButton = FormFieldFactory.picker(
        title: "Дата",
        valueTitle: "22.11",
        icon: Icons.calendar,
        chevron: false,
        action: {
            print("datePickerButton")
        }
    )
    
    private lazy var segmentsStackView = StackViewFactory.makeStackView()
    
    private lazy var attemptTypeSegments = SegmentedControlFactories.makeSegmentedButtonsView(
        title: "Тип попытки",
        selected: AttemptType.training
    )
    
    private lazy var attemptEffortSegments = SegmentedControlFactories.makeSegmentedButtonsView(
        title: "Как прошла попытка",
        selected: AttemptEffort.normal
    )
    
    private lazy var commentInputField = FormFieldFactory.textInput(
        title: "Комментарий",
        placeholder: "Ваши впечатления от попытки",
        icon: nil,
        keyboardType: .default
    )
    
    private lazy var mediaButton = FormFieldFactory.picker(
        title: "Медиа",
        valueTitle: "Добавить фото или видео",
        icon: Icons.media,
        chevron: false,
        action: {
            print("mediaButton")
        }
    )

    private lazy var saveButton = ButtonFactory.primary(
        title: "Сохранить рекорд",
        action: { [weak self] in
            self?.saveButtonTapped()
        })
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupViews()
        setupConstraints()
    }
    
    private func saveButtonTapped() {
        let date = Date()
        let attemptType = attemptTypeSegments.selectedItem.title
        let attemptEffort = attemptEffortSegments.selectedItem.title
        
        let exercise = exerciseSelectionButton.value
        let weight = weightInputField.view.value
        let resp = repsInputField.view.value
        let comment = commentInputField.view.value
        
        print(
            "exercise: \(exercise), weight: \(weight), resp: \(resp), comm: \(comment), date: \(date), attemptType: \(attemptType), attemptEffort: \(attemptEffort)"
        )
    }
}

// MARK: - Setup Views & Setup Constraints
private extension ResultEntryViewController {
    func setupViews() {
        
        commentInputField.textField.delegate = self
        view.backgroundColor = AppColor.background
        
        view.addSubview(scrollView)
        scrollView.stackView.addArrangedSubview(exerciseSelectionButton)
        
        scrollView.stackView.addArrangedSubview(exerciseMainStackView)
        exerciseMainStackView.addArrangedSubview(exerciseDataStackView)
        exerciseDataStackView.addArrangedSubview(weightInputField.view)
        exerciseDataStackView.addArrangedSubview(repsInputField.view)
        exerciseMainStackView.addArrangedSubview(datePickerButton)
        
        scrollView.stackView.addArrangedSubview(segmentsStackView)
        segmentsStackView.addArrangedSubview(attemptTypeSegments)
        segmentsStackView.addArrangedSubview(attemptEffortSegments)
        
        scrollView.stackView.addArrangedSubview(commentInputField.view)
        scrollView.stackView.addArrangedSubview(mediaButton)
        view.addSubview(saveButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Layout.spaceM),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Layout.spaceM),
            saveButton.heightAnchor.constraint(equalToConstant: Layout.buttonHeight),
            saveButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -Layout.spaceM),
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Layout.spaceM),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Layout.spaceM),
            scrollView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -Layout.spaceM)
        ])
    }
}

// MARK: - UITextFieldDelegate
extension ResultEntryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
