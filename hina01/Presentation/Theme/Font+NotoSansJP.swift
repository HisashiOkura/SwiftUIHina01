import SwiftUI

extension Font {

    /// Returns a Noto Sans JP font with the given preset style.
    static func noto(_ style: AppFontStyle) -> Font {
        .custom(notoPostScriptName(for: style.weight), size: style.size)
    }

    /// Returns a Noto Sans JP font with explicit weight and size.
    static func noto(weight: AppFontWeight = .regular, size: CGFloat) -> Font {
        .custom(notoPostScriptName(for: weight), size: size)
    }

    private static func notoPostScriptName(for weight: AppFontWeight) -> String {
        switch weight {
        case .thin: "NotoSansJP-Thin"
        case .extraLight: "NotoSansJP-Thin_ExtraLight"
        case .light: "NotoSansJP-Thin_Light"
        case .regular: "NotoSansJP-Thin_Regular"
        case .medium: "NotoSansJP-Thin_Medium"
        case .semiBold: "NotoSansJP-Thin_SemiBold"
        case .bold: "NotoSansJP-Thin_Bold"
        case .extraBold: "NotoSansJP-Thin_ExtraBold"
        case .black: "NotoSansJP-Thin_Black"
        }
    }
}
