//
//  StringExt.swift
//  Anista
//
//  Created by haiphan on 23/06/2021.
//

import Foundation
import UIKit

extension String {

    var getAllNumberInString: String {
        return self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }

    var formattedPhone: String {
        var formattedPhone = self
        formattedPhone = formattedPhone.replacingOccurrences(of: "+84", with: "0")
        if !formattedPhone.hasPrefix("0") {
            formattedPhone = "0" + formattedPhone
        }
        return formattedPhone
    }

    var trimed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func isNotEmpty() -> Bool {
        return self != ""
    }
    var isValidUserName: Bool {
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        return self.rangeOfCharacter(from: characterset.inverted) == nil && self.count > 3
    }

    var isValidPhone: Bool {
        let phoneRegex = "^0[0-9+]{0,1}+[0-9]{8,8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }

    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }

    var htmlToAttributedString: NSAttributedString? {
        let modifiedString = "<style>body{font-family: 'iCielGraphik-Regular'; font-size:14px; color: #032041; line-height: 1.2; }</style>\(self)"
        guard let data = modifiedString.data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data,
                                          options: [
                                            .documentType: NSAttributedString.DocumentType.html,
                                            .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }

    func createHtmlString(font: UIFont) -> String {
        return
"""
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';">
    <style>
        .content {
            font-size: 16px;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <div class="content">
        \(self)
    </div>
</body>
</html>
"""
    }

    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

extension String {
    func abc() -> String {
        var x = self.replacingOccurrences(of: "đ", with: "d")
        x = self.replacingOccurrences(of: "Đ", with: "D")
        let data = x.data(using: String.Encoding.ascii, allowLossyConversion: true)
        x = String(data: data!, encoding: String.Encoding.ascii) ?? ""
        return x
    }
}

extension String {
    fileprivate struct NumFormatter {
        static let instance = NumberFormatter()
    }

    var doubleValue: Double? {
        return NumFormatter.instance.number(from: self)?.doubleValue
    }

    var integerValue: Int? {
        return NumFormatter.instance.number(from: self)?.intValue
    }
}

extension String {
    var nilValue: String? {
        return self == "" ? nil : self
    }

    var intValue: Int {
        return Int(self) ?? 0
    }
}

extension Optional where Wrapped == String {

    var nilValue: String? {
        return stringValue == "" ? nil : self
    }

    var stringValue: String {
        return self ?? ""
    }

}

var intFormatter: NumberFormatter {
    let formater = NumberFormatter()
    formater.usesGroupingSeparator = true
    formater.groupingSize = 3
    formater.locale = .current
    formater.maximumFractionDigits = 0
    formater.minimumIntegerDigits = 1
    return formater
}

var currencyFormatter: NumberFormatter {
    let formater = NumberFormatter()
    formater.usesGroupingSeparator = true
    formater.groupingSeparator = "."
    formater.groupingSize = 3
    formater.locale = .current
    formater.maximumFractionDigits = 1
    formater.minimumIntegerDigits = 1
    return formater
}

extension NumberFormatter {
    func stringCurrecy(from strNumber: String?) -> String? {
        guard let s = strNumber else {
            return strNumber
        }
        if let double = Int64(s) {
            if let ss = currencyFormatter.string(from: NSNumber(value: double)) {
                return ss + ""
            }
        }
        return strNumber
    }

    func stringCurrecy(from number: Int64) -> String? {
        if let ss = currencyFormatter.string(from: NSNumber(value: number)) {
            return ss + ""
        }
        return ""
    }

    func string(from strNumber: String?) -> String? {
        guard let s = strNumber else {
            return strNumber
        }
        if let double = Double(s) {
            if let ss = currencyFormatter.string(from: NSNumber(value: double)) {
                return ss
            }
        }
        return strNumber
    }

}

extension NSMutableAttributedString {
    func setColor(color: UIColor, forText stringValue: String) {
       let range: NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}

extension String {
    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}

extension String {
    /// Extract first HTTP URL from text
    func extractUrl() -> URL? {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            let range = NSRange(location: 0, length: utf16.count)
            let matches = detector.matches(in: self, options: [], range: range)

            return matches.compactMap { $0.url }.first(where: { $0.absoluteString.hasPrefix("http") })
        } catch {
            return nil
        }
    }
}
