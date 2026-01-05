import UIKit

final class PickerRow: UIControl {
    
    private lazy var mainStackView = UIStackView()
    private lazy var infoStackView = UIStackView()
    private lazy var iconView = UIImageView()
    private lazy var title = UILabel()
    private lazy var chevron = UIImageView()
    
    init(with config: Configuration) {
        super.init(frame: .zero)
        setupPickerRow(with: config)
    }
    
    required init?(coder: NSCoder) {
        fatalError("PickerRow has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.12, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction]) {
                self.alpha = self.isHighlighted ? 0.7 : 1.0
            }
        }
    }
    
    private func setupPickerRow(with config: Configuration) {
        self.backgroundColor = config.backgroundColor
        self.tintColor = config.textColor
        self.layer.cornerRadius = Layout.cornerMedium
        
        setupMainStackView()
        setupInfoStackView()
        setupTitle(with: config)
        setupIconView(with: config)
        setupChevron()
        setupViews()
        
        addAction(UIAction { _ in
            config.action()
        }, for: .touchUpInside)
    }
    
    private func setupTitle(with config: Configuration) {
        title.text = config.title
        title.textColor = AppColor.textSecondary
        title.adjustsFontForContentSizeCategory = true
        title.font = Typography.buttonSecondary
    }
    
    private func setupMainStackView() {
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.distribution = .fill
        mainStackView.spacing = Layout.spaceS
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupInfoStackView() {
        infoStackView.axis = .horizontal
        infoStackView.alignment = .center
        infoStackView.spacing = Layout.spaceS
    }
    
    private func setupIconView(with config: Configuration) {
        iconView.image = config.icon
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = config.textColor
    }
    
    private func setupChevron() {
        chevron.image = UIImage(systemName: "chevron.right")
        chevron.contentMode = .scaleAspectFit
    }
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(mainStackView)
        mainStackView.addArrangedSubview(infoStackView)
        infoStackView.addArrangedSubview(iconView)
        infoStackView.addArrangedSubview(title)
        mainStackView.addArrangedSubview(chevron)
        
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 24),
            iconView.heightAnchor.constraint(equalToConstant: 24),
            
            mainStackView.leadingAnchor
                .constraint(equalTo: leadingAnchor, constant: Layout.spaceM),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.spaceM),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.spaceS),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Layout.spaceS),
            chevron.widthAnchor.constraint(equalToConstant: 18),
            chevron.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        [mainStackView, infoStackView, iconView, title, chevron].forEach { $0.isUserInteractionEnabled = false }
    }
}

extension PickerRow {
    struct Configuration {
        let title: String
        let icon: UIImage?
        let backgroundColor: UIColor
        let textColor: UIColor
        let action: () -> Void
    }
}
