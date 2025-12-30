import UIKit

enum InputFieldFactory {
    static func makeInputField(
        title: String?,
        placeholder: String,
        icon: UIImage?,
        keyboardType: UIKeyboardType = .decimalPad
    ) -> InputField {
        let config = InputField.Configuration(
            title: title,
            placeholder: placeholder,
            icon: icon,
            keyboardType: keyboardType
        )
        
        return InputField(with: config)
    }
}
