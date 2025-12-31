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
    
    static func pickerRow(
        title: String,
        icon: UIImage? = Icons.barbell,
        backgroundColor: UIColor = AppColor.surface,
        textColor: UIColor = AppColor.textSecondary,
        action: @escaping () -> Void
    ) -> PickerRow {
        let config = PickerRow.Configuration(
            title: title,
            icon: icon,
            backgroundColor: backgroundColor,
            textColor: textColor,
            action: action
        )
        
        return PickerRow(with: config)
    }
}
