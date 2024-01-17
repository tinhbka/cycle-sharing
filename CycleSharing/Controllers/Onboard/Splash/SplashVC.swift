

import UIKit

class SplashVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            AppUtils.shared.getSceneDelegate?.openFirstLanguage()
        })
    }
}
