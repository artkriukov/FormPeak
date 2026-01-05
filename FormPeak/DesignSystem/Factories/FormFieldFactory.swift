import UIKit

enum FormFieldFactory {

    static func textInput(
        title: String?,
        placeholder: String,
        icon: UIImage?,
        keyboardType: UIKeyboardType = .decimalPad,
        delegate: UITextFieldDelegate? = nil
    ) -> TextFormField {

        let input = InputField(with: .init(
            placeholder: placeholder,
            icon: icon,
            keyboardType: keyboardType
        ))

        if let delegate {
            input.uiTextField.delegate = delegate
        }

        let field = FormField(with: .init(
            title: title,
            contentView: input
        ))

        return TextFormField(
            view: field,
            textField: input.uiTextField
        )
    }

    static func picker(
        title: String?,
        valueTitle: String,
        icon: UIImage? = Icons.barbell,
        backgroundColor: UIColor = AppColor.surface,
        textColor: UIColor = AppColor.textSecondary,
        chevron: Bool,
        action: @escaping () -> Void
    ) -> FormField {

        let row = PickerRow(with: .init(
            title: valueTitle,
            icon: icon,
            backgroundColor: backgroundColor,
            textColor: textColor,
            chevron: chevron,
            action: action
        ))

        return FormField(with: .init(
            title: title,
            contentView: row
        ))
    }
}
