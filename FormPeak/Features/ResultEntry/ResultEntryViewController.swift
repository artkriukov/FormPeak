import UIKit

final class ResultEntryViewController: UIViewController {
    
    // MARK: - UI
    private lazy var mainStackView = StackViewFactory.makeStackView()
    
    private lazy var exerciseSelectionButton = ButtonFactory.pickerRow(
        title: "Становая тяга",
        action: {
            print("exerciseSelectionButton")
        }
    )
    
    private lazy var exerciseDataStackView = StackViewFactory.makeStackView(
        axis: .horizontal,
        spacing: Layout.spaceS,
        distribution: .fillEqually
    )
    
    private lazy var weightInputField = InputFieldFactory.makeInputField(
        title: "Вес, кг",
        placeholder: "Рекорд",
        icon: Icons.weight
    )
    
    private lazy var repsInputField = InputFieldFactory.makeInputField(
        title: "Повторы",
        placeholder: "Кол-во повторов",
        icon: Icons.repeatIcon
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
    
    private lazy var commentInputField = InputFieldFactory.makeInputField(
        title: "Комментарий",
        placeholder: "Ваши впечатления от попытки",
        icon: nil,
        keyboardType: .default
    )
    
    private lazy var actionButton = ButtonFactory.primary(
        title: "Сохранить рекорд",
        action: {
            print("actionButton")
        })
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupViews()
        setupConstraints()
    }
}

// MARK: - Setup Views & Setup Constraints
private extension ResultEntryViewController {
    func setupViews() {
        
        commentInputField.uiTextField.delegate = self
        
        view.backgroundColor = AppColor.background
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(exerciseSelectionButton)
        
        mainStackView.addArrangedSubview(exerciseDataStackView)
        exerciseDataStackView.addArrangedSubview(weightInputField)
        exerciseDataStackView.addArrangedSubview(repsInputField)
        
        mainStackView.addArrangedSubview(segmentsStackView)
        segmentsStackView.addArrangedSubview(attemptTypeSegments)
        segmentsStackView.addArrangedSubview(attemptEffortSegments)
        
        mainStackView.addArrangedSubview(commentInputField)
        
        view.addSubview(actionButton)
    }
    
    func setupConstraints() {        
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Layout.spaceM),
            mainStackView.leadingAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Layout.spaceM),
            mainStackView.trailingAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Layout.spaceM),
            
            exerciseSelectionButton.heightAnchor.constraint(equalToConstant: Layout.buttonHeight),
            
            actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Layout.spaceM),
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Layout.spaceM),
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Layout.spaceM),
            actionButton.heightAnchor.constraint(equalToConstant: Layout.buttonHeight)
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
