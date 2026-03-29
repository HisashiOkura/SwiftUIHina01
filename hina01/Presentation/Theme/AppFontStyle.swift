import SwiftUI

// MARK: - Font Weight

enum AppFontWeight: Sendable {
    case thin
    case extraLight
    case light
    case regular
    case medium
    case semiBold
    case bold
    case extraBold
    case black
}

// MARK: - Font Style Presets

/// Typography presets for the app.
///
/// Usage:
/// ```
/// Text("Hello").font(.inter(.bodyLarge))
/// Text("タイトル").font(.noto(.headlineMedium))
/// Text("Custom").font(.inter(weight: .bold, size: 20))
/// ```
enum AppFontStyle: Sendable {
    /// 32pt Bold — Screen titles, hero text
    case displayLarge
    /// 28pt Bold
    case displayMedium
    /// 24pt Bold
    case displaySmall

    /// 22pt SemiBold — Section headers
    case headlineLarge
    /// 20pt SemiBold
    case headlineMedium
    /// 18pt SemiBold
    case headlineSmall

    /// 16pt Medium — Subtitles, emphasized labels
    case titleLarge
    /// 14pt Medium
    case titleMedium
    /// 12pt Medium
    case titleSmall

    /// 17pt Regular — Primary body text
    case bodyLarge
    /// 15pt Regular
    case bodyMedium
    /// 13pt Regular
    case bodySmall

    /// 14pt Medium — Buttons, tabs, badges
    case labelLarge
    /// 12pt Medium
    case labelMedium
    /// 11pt Medium
    case labelSmall

    /// 12pt Regular — Supplementary info, timestamps
    case caption

    var size: CGFloat {
        switch self {
        case .displayLarge: 32
        case .displayMedium: 28
        case .displaySmall: 24
        case .headlineLarge: 22
        case .headlineMedium: 20
        case .headlineSmall: 18
        case .titleLarge: 16
        case .titleMedium: 14
        case .titleSmall: 12
        case .bodyLarge: 17
        case .bodyMedium: 15
        case .bodySmall: 13
        case .labelLarge: 14
        case .labelMedium: 12
        case .labelSmall: 11
        case .caption: 12
        }
    }

    var weight: AppFontWeight {
        switch self {
        case .displayLarge, .displayMedium, .displaySmall:
            .bold
        case .headlineLarge, .headlineMedium, .headlineSmall:
            .semiBold
        case .titleLarge, .titleMedium, .titleSmall:
            .medium
        case .bodyLarge, .bodyMedium, .bodySmall:
            .regular
        case .labelLarge, .labelMedium, .labelSmall:
            .medium
        case .caption:
            .regular
        }
    }
}
