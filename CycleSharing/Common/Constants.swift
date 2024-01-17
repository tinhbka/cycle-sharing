
import Foundation
import UIKit

struct Image {
    static let shared = R.image
}

struct Text {
    static let shared = R.string.localizable
}

class Constant {
    static var CurrentLocalization = "CurrentLocalization"
    static var userCode: String = "UserCode"
    static var firstimeIntro = "FirstimeIntro"
    static var firstimeLanguage = "FirstimeLanguage"
    
    static let privacyUrl: String = "https://firebasestorage.googleapis.com/v0/b/gps-phone-tracker-5760a.appspot.com/o/Privacy-Policy.html?alt=media&token=cc66a099-8ad7-463b-aa14-24679ea1d312"
    static let termUrl: String = "https://sites.google.com/vtn-global.com/gpstracker-terms?usp=sharing"

    static let appStoreLink: String = "https://apps.apple.com/us/app/id\(appStoreId)"
    
    static let appStoreId: String = "6450284671"
    static let appFlyerId: String = "LikYKU2zUYTct7BoQ7MuJY"
    static let googleMapId: String = "AIzaSyAJCjFairN0Sy5-wlfV-uJLtssGo5dPzqI"
    
    #if TEST
    static let sharedSecret: String = "306fee52f7354b1e82de8258e7593de3"
    #else
    static let sharedSecret: String = "615b7b46e016473585f13840b59fdda2"
    #endif
}

extension UIColor {
}

extension UIFont {
    static let robotoRegular = R.font.robotoRegular(size: 16)!
    static let robotoBoldItalic = UIFont(name: "Roboto-BoldItalic", size: 16)!
    static let robotoBold = UIFont(name: "Roboto-Bold", size: 16)!
    static let robotoItalic = UIFont(name: "Roboto-Italic", size: 16)!
    static let robotoBlack = UIFont(name: "Roboto-Black", size: 16)!
    static let robotoBlackItalic = UIFont(name: "Roboto-BlackItalic", size: 16)!
    static let robotoLight = UIFont(name: "Roboto-Light", size: 16)!
    static let robotoLightItalic = UIFont(name: "Roboto-LightItalic", size: 16)!
    static let robotoMediumItalic = UIFont(name: "Roboto-MediumItalic", size: 16)!
    static let robotoMedium = UIFont(name: "Roboto-Medium", size: 16)!
    static let robotoThin = UIFont(name: "Roboto-Thin", size: 16)!
    static let robotoThinItalic = UIFont(name: "Roboto-ThinItalic", size: 16)!
}

