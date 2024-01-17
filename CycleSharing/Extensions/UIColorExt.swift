//
//  UIColorExt.swift
//  Anista
//
//  Created by haiphan on 14/06/2021.
//

import Foundation
import UIKit

public extension UIColor {

    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & Red.mask) >> Red.rightShift) / UIColor.maxInByte
        let green = CGFloat((hex & Green.mask) >> Green.rightShift) / UIColor.maxInByte
        let blue = CGFloat((hex & Blue.mask) >> Blue.rightShift) / UIColor.maxInByte

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    @objc
    static func color(hex: UInt, alpha: CGFloat) -> UIColor {
        UIColor(hex: hex, alpha: alpha)
    }

    @objc
    static func color(hex: UInt) -> UIColor {
        UIColor(hex: hex)
    }
}

private extension UIColor {
    enum Red {
        static let mask: UInt = 0xFF0000
        static let rightShift = 16
    }

    enum Green {
        static let mask: UInt = 0x00FF00
        static let rightShift = 8
    }

    enum Blue {
        static let mask: UInt = 0x0000FF
        static let rightShift = 0
    }

    static let maxInByte = CGFloat(0xFF)
}

extension UIColor {

    convenience init(hexStr: String) {
        let hex = hexStr.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }

    static let background: UIColor  = {
        if #available(iOS 13.0, *) {
            return UIColor.systemBackground
        } else {
            return UIColor.white
        }
    }()

    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
