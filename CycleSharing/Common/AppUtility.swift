

import Foundation
import UIKit

class AppUtils {
    static let shared = AppUtils()

    func LOG(st: Any?) {
        guard let st = st else {
            print("DebugLog: string nil")
            return
        }
        print(st)
    }

    var getSceneDelegate: SceneDelegate? {
        guard let scene = UIApplication.shared.connectedScenes.first, let sd = scene.delegate as? SceneDelegate else {
            return nil
        }
        return sd
    }

    func showLoading() {
        LoadingViewIndicator.show()
    }

    func hideLoading() {
        LoadingViewIndicator.hide()
    }
}
