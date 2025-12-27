import UIKit

final class InputField: UIView {
    
    private lazy var stackView = UIStackView()
    private lazy var inputTitleLabel = UILabel()
    private lazy var textField = InsetTextField()
    private lazy var textFieldIcon = UIImageView()
    
    init(with config: Configuration) {
        super.init(frame: .zero)
        setupInputField(with: config)
    }
    
    required init?(coder: NSCoder) {
        fatalError("InputField has not been implemented")
    }
    
    private func setupInputField(with config: Configuration) {
        setupStackView()
        setupTitle(with: config)
        setupTextField(with: config)
        setupViews()
    }
    
    private func setupStackView() {
        stackView.spacing = Layout.spaceS
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTitle(with config: Configuration) {
        inputTitleLabel.text = config.title
        inputTitleLabel.textColor = AppColor.textPrimary
        inputTitleLabel.font = Typography.body
    }
    
    private func setupTextField(with config: Configuration) {
        textField.placeholder = config.placeholder
        textField.keyboardType = config.keyboardType
        textField.layer.cornerRadius = Layout.cornerMedium
        textField.backgroundColor = AppColor.surface
        textField.leftView = makeLeftIconView(config.icon)
        textField.leftViewMode = config.icon == nil ? .never : .always
    }
    
    private func makeLeftIconView(_ image: UIImage?) -> UIView? {
        guard let image else { return nil }
        
        let leftPadding: CGFloat = 16
        let iconSize: CGFloat = 20
        let spacing: CGFloat = 8
        let height: CGFloat = Layout.rowHeight
        
        let container = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: leftPadding + iconSize + spacing,
                height: height
            )
        )
        
        textFieldIcon.image = image
        textFieldIcon.contentMode = .scaleAspectFill
        textFieldIcon.frame = CGRect(
            x: leftPadding,
            y: (height - iconSize) / 2,
            width: iconSize,
            height: iconSize
        )
        
        container.addSubview(textFieldIcon)
        
        return container
    }
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.addArrangedSubview(inputTitleLabel)
        stackView.addArrangedSubview(textField)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension InputField {
    struct Configuration {
        let title: String?
        let placeholder: String
        let icon: UIImage?
        let keyboardType: UIKeyboardType
    }
}

private final class InsetTextField: UITextField {
    var insets = Layout.contentInset
    
    private var leftW: CGFloat { leftView?.bounds.width ?? 0 }
    private var rightW: CGFloat { rightView?.bounds.width ?? 0 }
    
    private func insetRect(_ bounds: CGRect) -> CGRect {
        bounds.inset(by: UIEdgeInsets(
            top: insets.top,
            left: insets.left + leftW,
            bottom: insets.bottom,
            right: insets.right + rightW
        ))
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        insetRect(bounds)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        insetRect(bounds)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        insetRect(bounds)
    }
}
