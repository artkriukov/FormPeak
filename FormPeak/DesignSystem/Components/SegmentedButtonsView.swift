import UIKit

protocol SegmentedItem: CaseIterable, Hashable {
    var title: String { get }
}

final class SegmentedButtonsView<Item: SegmentedItem>: UIView {
    
    private lazy var sectionTitle = UILabel()
    private lazy var buttonsStackView = UIStackView()
    private var segmentedButtons: [UIButton] = []
    
    private var selectedButton: Item
    
    init(with config: Configuration) {
        self.selectedButton = config.selected
        super.init(frame: .zero)
        setupSegmentedButtons(with: config)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSegmentedButtons(with config: Configuration) {
        setupTitle(with: config)
        setupStackView()
        setupButtons(with: config)
        setupViews()
    }
    
    private func setupTitle(with config: Configuration) {
        sectionTitle.text = config.title
        sectionTitle.textColor = AppColor.textPrimary
        sectionTitle.font = Typography.sectionHeader
        sectionTitle.adjustsFontForContentSizeCategory = true
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupStackView() {
        buttonsStackView.axis = .horizontal
        buttonsStackView.spacing = Layout.spaceXS
        buttonsStackView.distribution = .fillProportionally
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupButtons(with config: Configuration) {
        buttonsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        segmentedButtons = Item.allCases.enumerated().map { index, item in
            let button = UIButton(type: .system)
            button.setTitle(item.title, for: .normal)
            button.setTitleColor(AppColor.textPrimary, for: .normal)
            button.titleLabel?.font = Typography.buttonSecondary
            button.layer.cornerRadius = Layout.cornerMedium
            button.tag = index
            
            button.addAction(UIAction { [weak self] _ in
                guard let self else { return }
                print(item)
                self.selectedButton = item
                switchButtonBackground()
            }, for: .touchUpInside)
            
            return button
        }
        
        switchButtonBackground()
        segmentedButtons.forEach { buttonsStackView.addArrangedSubview($0) }
    }
    
    private func switchButtonBackground() {
        for (index, item) in Item.allCases.enumerated() {
            let button = segmentedButtons[index]
            button.backgroundColor = ( item == selectedButton ) ? AppColor.primary : AppColor.surface
            button.setTitleColor(( item == selectedButton ) ?
                                    AppColor.textOnPrimary :
                                    AppColor.textPrimary,
                                 for: .normal)
        }
    }
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sectionTitle)
        addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            sectionTitle.topAnchor.constraint(equalTo: topAnchor),
            sectionTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionTitle.trailingAnchor.constraint(equalTo: trailingAnchor),

            buttonsStackView.topAnchor.constraint(equalTo: sectionTitle.bottomAnchor, constant: Layout.spaceM),
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension SegmentedButtonsView {
    struct Configuration {
        let title: String
        let selected: Item
    }
}
