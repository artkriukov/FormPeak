import UIKit

enum ButtonFactory {
    static func primary(
        title: String,
        textColor: UIColor = AppColor.textOnPrimary,
        backgroundColor: UIColor = AppColor.primary,
        action: @escaping () -> Void
    ) -> PrimaryButton {
        let config = PrimaryButton.Configuration(
            title: title,
            textColor: textColor,
            backgroundColor: backgroundColor,
            action: action
        )
        
        return PrimaryButton(with: config)
    }
}
