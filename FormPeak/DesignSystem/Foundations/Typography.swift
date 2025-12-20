import UIKit

/// adjustsFontForContentSizeCategory = true
/// Включает поддержку Dynamic Type:
/// шрифт будет автоматически меняться при изменении
/// размера текста в настройках системы.

enum Typography {
    // MARK: - Titles
    static let titleLarge: UIFont = .preferredFont(forTextStyle: .title1)
    static let titleMedium: UIFont = .preferredFont(forTextStyle: .title2)
    static let titleSmall: UIFont = .preferredFont(forTextStyle: .title3)
    static let sectionHeader: UIFont = .preferredFont(forTextStyle: .headline)

    // MARK: - Body
    static let body: UIFont = .preferredFont(forTextStyle: .body)
    static let bodySecondary: UIFont = .preferredFont(forTextStyle: .subheadline)
    static let bodyStrong: UIFont = .preferredFont(forTextStyle: .headline)

    // MARK: - Caption
    static let caption: UIFont = .preferredFont(forTextStyle: .caption1)
    static let captionBold: UIFont = .preferredFont(forTextStyle: .caption1)
    static let badge: UIFont = .preferredFont(forTextStyle: .caption2)

    // MARK: - Buttons
    static let buttonPrimary: UIFont = .preferredFont(forTextStyle: .headline)
    static let buttonSecondary: UIFont = .preferredFont(forTextStyle: .callout)

    // MARK: - Inputs & Nav
    static let input: UIFont = .preferredFont(forTextStyle: .body)
    static let inputPlaceholder: UIFont = .preferredFont(forTextStyle: .body)
    static let navBarTitle: UIFont = .preferredFont(forTextStyle: .headline)
    static let chip: UIFont = .preferredFont(forTextStyle: .subheadline)
}
