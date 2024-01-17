//
//  UIButtonExt.swift
//  Anista
//
//  Created by haiphan on 23/06/2021.
//

import Foundation
import UIKit

extension UIButton {
        @IBInspectable var adjustFontSizeToWidth: Bool {
            get {
                return titleLabel!.adjustsFontSizeToFitWidth
            }
            set {
                titleLabel!.adjustsFontSizeToFitWidth = newValue
                titleLabel!.lineBreakMode             = .byClipping
            }
        }
    }
