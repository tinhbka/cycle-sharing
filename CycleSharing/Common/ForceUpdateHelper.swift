//
//  ForceUpdateHelper.swift
//  Anista
//
//  Created by nguyen.ngoc.ban on 21/09/2022.
//

import Foundation
import RxSwift

class ForceUpdateHelper {
    static let shared = ForceUpdateHelper()
    var disposeBag = DisposeBag()
    var needForceUpdate = false
    var isChecking = false

    private init() {
        checkVersion()
    }

    func checkVersion() {
        guard !isChecking else { return }
        isChecking = true
    }

    func showUpdateAlert(isForceUpdate: Bool) {
        if isForceUpdate {
            needForceUpdate = true
        }
        let alert = UIAlertController(title: nil, message: "Đã có phiên bản mới, bạn vui lòng nâng cấp ứng dụng để sử dụng các tính năng mới nhất.", preferredStyle: .alert)
        if !isForceUpdate {
            alert.addAction(UIAlertAction(title: "Để sau", style: .cancel))
        }
        alert.addAction(UIAlertAction(title: "Cập nhật", style: .default, handler: { _ in
            self.openAppStore()
        }))
    }

    func openAppStore() {
        guard let url = URL(string: "https://itunes.apple.com/app/id1579602477?mt=8") else {
            return
        }
        UIApplication.shared.open(url)
    }
}
