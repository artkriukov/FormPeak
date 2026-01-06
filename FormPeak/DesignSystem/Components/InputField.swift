import UIKit

final class InputField: UIView {

    private lazy var textField = InsetTextField()
    private lazy var textFieldIcon = UIImageView()

    var uiTextField: UITextField { textField }

    init(with config: Configuration) {
        super.init(frame: .zero)
        setupInputField(with: config)
    }

    required init?(coder: NSCoder) {
        fatalError("InputField has not been implemented")
    }

    private func setupInputField(with config: Configuration) {
        setupTextField(with: config)
        setupViews()
    }

    private func setupTextField(with config: Configuration) {
        textField.placeholder = config.placeholder
        textField.keyboardType = config.keyboardType
        textField.layer.cornerRadius = Layout.cornerMedium
        textField.backgroundColor = AppColor.surface
        textField.font = Typography.bodySecondary
        textField.returnKeyType = .done
        textField.attributedPlaceholder = NSAttributedString(
            string: config.placeholder,
            attributes: [
                .font: Typography.inputPlaceholder,
                .foregroundColor: AppColor.textSecondary
            ]
        )

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
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: Layout.rowHeight)
        ])
    }
}

extension InputField {
    struct Configuration {
        let placeholder: String
        let icon: UIImage?
        let keyboardType: UIKeyboardType
    }
}

extension InputField: FormFieldValueView {
    var formValue: String? {
        get {
            textField.text
        }
        set {
            textField.text = newValue
        }
    }
}

private final class InsetTextField: UITextField {
    var insets = Layout.contentInset
    
    private var leftW: CGFloat { leftView?.bounds.width ?? 0 }
    private var rightW: CGFloat { rightView?.bounds.width ?? 0 }
    
    private func insetRect(_ bounds: CGRect) -> CGRect {
        bounds.inset(by: UIEdgeInsets(
            top: insets.top - 4,
            left: insets.left + leftW,
            bottom: insets.bottom - 4,
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
