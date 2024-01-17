//
//  UILabelExt.swift
//  Anista
//
//  Created by Tong Minh Nguyet on 16/05/2022.
//

import Foundation
import UIKit

extension UILabel {

    func setLineSpacing(_ lineSpacing: CGFloat = 5) {
        guard let text = self.text else { return }

        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()

        style.lineSpacing = lineSpacing
        attributeString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: style,
            range: NSRange(location: 0, length: attributeString.length))

        self.attributedText = attributeString
    }

}
