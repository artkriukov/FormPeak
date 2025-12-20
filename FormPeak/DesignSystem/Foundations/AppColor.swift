//
//  Colors.swift
//  FormPeak
//
//  Created by Artem Kriukov on 19.12.2025.
//

import UIKit

enum AppColor {
    // Accents
    static let primary = R.color.primary() ?? .systemBlue
    static let primaryPressed = R.color.primaryPressed() ?? .systemBlue
    
    // Base
    static let background = R.color.background() ?? .black
    static let surface = R.color.surface() ?? .systemGray
    static let modalBackground = R.color.modalBackground() ?? .systemGray2
    
    // Text
    static let textPrimary = R.color.textPrimary() ?? .label
    static let textSecondary = R.color.textSecondary() ?? .systemGray3
    static let textTertiary = R.color.textTertiary() ?? .systemGray4
    static let textOnPrimary = R.color.textOnPrimary() ?? .white
    
    // Status
    static let statePositive = R.color.statePositive() ?? .systemGreen
    static let stateNegative = R.color.stateNegative() ?? .systemRed
    static let stateAttention = R.color.stateAttention() ?? .systemOrange
    
    // Borders
    static let borderSubtle = R.color.borderSubtle() ?? .systemGray
    static let borderStrong = R.color.borderStrong() ?? .systemBlue
}
