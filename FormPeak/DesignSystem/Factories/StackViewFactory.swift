import UIKit

enum StackViewFactory {
    static func makeStackView(
        axis: NSLayoutConstraint.Axis = .vertical,
        spacing: CGFloat = Layout.spaceXL,
        distribution: UIStackView.Distribution = .fill,
        alignment: UIStackView.Alignment = .fill,
        tamic: Bool = false
    ) -> UIStackView {
        let element = UIStackView()
        element.axis = axis
        element.spacing = spacing
        element.distribution = distribution
        element.alignment = alignment
        element.translatesAutoresizingMaskIntoConstraints = tamic
        return element
    }
}
