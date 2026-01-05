import UIKit

final class ScrollingStackView: UIScrollView {

    enum Axis {
        case vertical
        case horizontal
    }

    public let stackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private let axis: Axis

    init(
        axis: Axis = .vertical,
        spacing: CGFloat = 12,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        contentInsets: UIEdgeInsets = .zero
    ) {
        self.axis = axis
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        
        alwaysBounceVertical = (axis == .vertical)
        alwaysBounceHorizontal = (axis == .horizontal)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false

        stackView.axis = (axis == .vertical) ? .vertical : .horizontal
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution

        contentInset = contentInsets
        contentInsetAdjustmentBehavior = .never

        addSubview(stackView)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        let contentG = contentLayoutGuide
        let frameG = frameLayoutGuide

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentG.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentG.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentG.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentG.bottomAnchor),

            (axis == .vertical
             ? stackView.widthAnchor.constraint(equalTo: frameG.widthAnchor)
             : stackView.heightAnchor.constraint(equalTo: frameG.heightAnchor))
        ])
    }
}
