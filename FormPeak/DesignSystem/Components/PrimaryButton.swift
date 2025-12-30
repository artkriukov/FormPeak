import UIKit

final class PrimaryButton: UIButton {
    
    init(with config: Configuration) {
        super.init(frame: .zero)
        makeButton(with: config)
    }

    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.12, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction]) {
                self.alpha = self.isHighlighted ? 0.7 : 1.0
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("PrimaryButton has not been implemented")
    }
    
    private func makeButton(with config: Configuration) {
        self.setTitle(config.title, for: .normal)
        self.setTitleColor(config.textColor, for: .normal)
        self.backgroundColor = config.backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = Layout.cornerMedium
        
        addAction(UIAction { _ in
            config.action()
        }, for: .touchUpInside)
    }
}

extension PrimaryButton {
    struct Configuration {
        let title: String
        let textColor: UIColor
        let backgroundColor: UIColor
        let action: () -> Void
    }
}
