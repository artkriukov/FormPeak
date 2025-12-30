import UIKit

enum AppColor {
    // MARK: - Accents
    static let primary = R.color.primary() ?? .systemBlue
    static let primaryPressed = R.color.primaryPressed() ?? .systemBlue
    
    // MARK: - Base
    static let background = R.color.background() ?? .black
    static let surface = R.color.surface() ?? .systemGray
    static let modalBackground = R.color.modalBackground() ?? .systemGray2
    
    // MARK: - Text
    static let textPrimary = R.color.textPrimary() ?? .label
    static let textSecondary = R.color.textSecondary() ?? .systemGray3
    static let textTertiary = R.color.textTertiary() ?? .systemGray4
    static let textOnPrimary = R.color.textOnPrimary() ?? .white
    
    // MARK: - Status
    static let statePositive = R.color.statePositive() ?? .systemGreen
    static let stateNegative = R.color.stateNegative() ?? .systemRed
    static let stateAttention = R.color.stateAttention() ?? .systemOrange
    
    // MARK: - Borders
    static let borderSubtle = R.color.borderSubtle() ?? .systemGray
    static let borderStrong = R.color.borderStrong() ?? .systemBlue
}
