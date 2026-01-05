import UIKit

struct TextFormField {
    let view: FormField
    let textField: UITextField
}

final class FormField: UIView {

    private lazy var stackView = UIStackView()
    private lazy var titleLabel = UILabel()

    private var contentView: UIView?

    init(with config: Configuration) {
        super.init(frame: .zero)
        setupFormField(with: config)
    }

    required init?(coder: NSCoder) {
        fatalError("FormField has not been implemented")
    }

    func setContent(_ view: UIView) {
        removeContentIfNeeded()
        contentView = view
        stackView.addArrangedSubview(view)
    }

    private func removeContentIfNeeded() {
        guard let contentView else { return }

        stackView.removeArrangedSubview(contentView)
        contentView.removeFromSuperview()

        self.contentView = nil
    }

    private func setupFormField(with config: Configuration) {
        setupStackView()
        setupTitle(with: config)
        setupViews()

        if let contentView = config.contentView {
            setContent(contentView)
        }
    }

    private func setupStackView() {
        stackView.spacing = Layout.spaceS
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupTitle(with config: Configuration) {
        titleLabel.text = config.title
        titleLabel.textColor = AppColor.textPrimary
        titleLabel.font = Typography.sectionHeader
        titleLabel.isHidden = config.title == nil
    }

    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension FormField {
    struct Configuration {
        let title: String?
        let contentView: UIView?
    }
}
