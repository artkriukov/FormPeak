import UIKit

enum InputFieldFactory {
    static func makeInputField(
        with title: String?,
        placeholder: String,
        icon: UIImage?,
        keyboardType: UIKeyboardType = .default
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
