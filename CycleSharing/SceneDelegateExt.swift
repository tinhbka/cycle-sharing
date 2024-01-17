//
//  SceneDelegateExt.swift
//  Anista
//
//  Created by haiphan on 14/06/2021.
//

import Foundation
import UIKit

extension SceneDelegate {

    func startApp() {
        let vcSplash = SplashVC()
        window?.rootViewController = vcSplash
    }
    
    func openFirstLanguage() {
        let lanVC = LanguageVC(true)
        window?.rootViewController = lanVC
        window?.makeKeyAndVisible()
    }
}
