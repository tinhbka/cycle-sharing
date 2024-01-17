
import Foundation
import UIKit

public struct DesignSystem {

    public enum AppColor {
        public static let organce = UIColor(hex: 0xFF7B17)
        public static let green = UIColor(hex: 0x0FB75F)
        public static let red = UIColor(hex: 0xE90707)
        public static let black = UIColor(hex: 0x212121)
        public static let grayE2 = UIColor(hex: 0xE2E2E2)
        public static let grayA1 = UIColor(hex: 0xA19F9F)
        public static let gray7C = UIColor(hex: 0x7C7B7B)
        public static let grayF1 = UIColor(hex: 0xF1F1F1)

    }

    /// Fonts
    public enum Fonts {}
}

// iOS system font is SF Pro Display and Texš
extension DesignSystem.Fonts {
    public enum Roboto: String {
        case regular = "Regular"
        case boldItalic = "BoldItalic"
        case bold = "Bold"
        case italic = "Italic"
        case black = "Black"
        case blackItalic = "BlackItalic"
        case light = "Light"
        case lightItalic = "LightItalic"
        case mediumItalic = "MediumItalic"
        case medium = "Medium"
        case thin = "Thin"
        case thinItalic = "ThinItalic"

        public var name: String {
            "Roboto-".appending(self.rawValue)
        }
    }

    public enum Mulish: String {
        case regular = "Regular"

        public var name: String {
            "Mulish-".appending(self.rawValue)
        }
    }

    public static func systemFont(_ size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .regular)
    }

    public static func systemAppFontRegular(_ size: CGFloat) -> UIFont {
        UIFont(name: Roboto.regular.name, size: size) ??
        UIFont.systemFont(ofSize: size, weight: .regular)
    }

    public static func systemAppFontBold(_ size: CGFloat) -> UIFont {
        UIFont(name: Roboto.bold.name, size: size) ??
        UIFont.systemFont(ofSize: size, weight: .bold)
    }

    public static func systemAppFontItalic(_ size: CGFloat) -> UIFont {
        UIFont(name: Roboto.italic.name, size: size) ??
        UIFont.italicSystemFont(ofSize: size)
    }

    public static func systemAppFontMedium(_ size: CGFloat) -> UIFont {
        UIFont(name: Roboto.medium.name, size: size) ??
        UIFont.systemFont(ofSize: size, weight: .medium)
    }

    public static func mulishAppFontRegular(_ size: CGFloat) -> UIFont {
        UIFont(name: Mulish.regular.name, size: size) ??
        UIFont.systemFont(ofSize: size, weight: .regular)
    }
}
