import SwiftUI

extension Font {

    /// Returns an Inter font with the given preset style.
    static func inter(_ style: AppFontStyle) -> Font {
        .custom(interPostScriptName(for: style.weight), size: style.size)
    }

    /// Returns an Inter font with explicit weight and size.
    static func inter(weight: AppFontWeight = .regular, size: CGFloat) -> Font {
        .custom(interPostScriptName(for: weight), size: size)
    }

    private static func interPostScriptName(for weight: AppFontWeight) -> String {
        switch weight {
        case .thin: "Inter-Regular_Thin"
        case .extraLight: "Inter-Regular_ExtraLight"
        case .light: "Inter-Regular_Light"
        case .regular: "Inter-Regular"
        case .medium: "Inter-Regular_Medium"
        case .semiBold: "Inter-Regular_SemiBold"
        case .bold: "Inter-Regular_Bold"
        case .extraBold: "Inter-Regular_ExtraBold"
        case .black: "Inter-Regular_Black"
        }
    }
}
