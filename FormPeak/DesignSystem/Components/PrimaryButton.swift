//
//  PrimaryButton.swift
//

import UIKit

final class PrimaryButton: UIButton {
    
    init(with config: Configuration) {
        super.init(frame: .zero)
        makeButton(with: config)
    }

    required init?(coder: NSCoder) {
        fatalError("PrimaryButton has not been implemented")
    }
    
    private func makeButton(with config: Configuration) {
        self.setTitle(config.title, for: .normal)
        self.tintColor = config.textColor
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
