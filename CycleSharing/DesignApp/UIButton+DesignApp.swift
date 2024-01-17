
import Foundation
import UIKit

extension UIButton {

    func followSetupOrganceButtonSystem() {
        self.backgroundColor = DesignSystem.AppColor.organce
        self.titleLabel?.font = DesignSystem.Fonts.systemAppFontMedium(18)
        self.titleLabel?.textColor = .white
        self.layer.cornerRadius = Double(self.frame.size.height) / 2
        self.clipsToBounds = true
    }

    func followSetupGrayButtonSystem() {
        self.backgroundColor = DesignSystem.AppColor.gray7C
        self.titleLabel?.font = DesignSystem.Fonts.systemAppFontMedium(18)
        self.titleLabel?.textColor = .white
        self.layer.cornerRadius = 200
    }
}
