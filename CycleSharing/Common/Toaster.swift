//
//  Toaster.swift
//  Anista
//
//  Created by Tong Minh Nguyet on 17/05/2022.
//

import Foundation
import UIKit

class Toaster {

    class func show(message: String) {
        show(image: nil, message: message, backgroundColor: UIColor.black.withAlphaComponent(0.5), messageColor: .white,
             position: .center)
    }

    class func show(image: UIImage?, message: String, backgroundColor: UIColor, messageColor: UIColor, position: ToastPosition) {
        var style = ToastStyle()
        style.backgroundColor = backgroundColor
        style.messageColor = messageColor
        style.messageFont = UIFont.systemFont(ofSize: 14, weight: .medium)
        style.imageSize = CGSize(width: 20, height: 20)
        style.verticalPadding = 10

        ToastManager.shared.style.verticalPadding = 70

        guard let currentMainWindow = UIApplication.shared.windows.first else {
            log("Toaster error")
            return
        }
        currentMainWindow.makeToast(message, duration: 2, position: position, image: image, style: style, completion: nil)
    }
}

func showToaster(_ message: String) {
    Toaster.show(message: message)
}

func showToasterError(_ error: Error) {
    Toaster.show(message: error.localizedDescription)
}

func showToasterOtherError() {
    Toaster.show(message: "Đã có lỗi xảy ra, vui lòng thử lại sau.")
}

func showToasterInDevelopFunction() {
    Toaster.show(message: "Tính năng đang được phát triển, vui lòng thử lại sau")
}
