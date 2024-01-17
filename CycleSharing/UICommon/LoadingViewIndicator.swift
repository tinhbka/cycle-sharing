//
//  LoadingViewIndicator.swift
//  CycleSharing
//
//  Created by Tinh Vu on 12/01/2024.
//

import Foundation
import UIKit

private let loadingViewIndicatorTagValue = 1111
private let animationTime = 0.25
private let overlayAlpha: CGFloat = 0.3

class LoadingViewIndicator {

    static var currentView: UIView?

    static func show() {
        DispatchQueue.main.async {
            guard let currentMainWindow = UIApplication.shared.windows.first else {
                return
            }
            show(overlayTarget: currentMainWindow)
        }
    }

    static func show(overlayTarget: UIView) {
        if currentView?.superview == overlayTarget {
            return
        }
        hide()
        DispatchQueue.main.async {
            let view = UIView()
            overlayTarget.bringSubviewToFront(view)
            overlayTarget.addSubview(view)
            view.boundsToSuperView()
            let overlay = UIView()
            view.addSubview(overlay)
            overlay.boundsToSuperView()
            let indicator = UIActivityIndicatorView(style: .medium)
            indicator.color = UIColor.black
            indicator.backgroundColor = .white
            let dw = UIScreen.main.bounds.width
            let dh = UIScreen.main.bounds.height
            let marginIndicator: CGFloat = 10
            let w = indicator.bounds.width + marginIndicator
            let h = indicator.bounds.height + marginIndicator
            indicator.frame = CGRect(
                x: (dw - w) / 2,
                y: (dh - h) / 2,
                width: w,
                height: h)

            indicator.layer.masksToBounds = true
            indicator.layer.cornerRadius = w / 2
            view.addSubview(indicator)
            indicator.startAnimating()
//            UIView.beginAnimations(nil, context: nil)
//            UIView.setAnimationDuration(animationTime)
//            overlay.backgroundColor = UIColor.gray.withAlphaComponent(overlayAlpha)
//            UIView.commitAnimations()
            currentView = view
        }
    }

    static func hide() {
        DispatchQueue.main.async {
            guard let view = currentView else {
                return
            }
            view.removeFromSuperview()
            currentView = nil
        }
    }
}

extension UIView {

    func showLoadingInView() {
        if self.viewWithTag(loadingViewIndicatorTagValue) != nil {
            return
        }
        let view = UIView()
        view.tag = loadingViewIndicatorTagValue
        self.bringSubviewToFront(view)
        self.addSubview(view)
        view.boundsToSuperView()
        let overlay = UIView()
        view.addSubview(overlay)
        overlay.boundsToSuperView()
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = UIColor.black
        indicator.backgroundColor = UIColor.gray.withAlphaComponent(overlayAlpha)
        let dw = UIScreen.main.bounds.width
        let dh = UIScreen.main.bounds.height
        let marginIndicator: CGFloat = 10
        let w = indicator.bounds.width + marginIndicator
        let h = indicator.bounds.height + marginIndicator
        indicator.frame = CGRect(
            x: (dw - w) / 2,
            y: (dh - h) / 2,
            width: w,
            height: h)

        indicator.layer.masksToBounds = true
        view.addSubview(indicator)
        indicator.boundsToSuperView()
        indicator.startAnimating()
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(animationTime)
//        overlay.backgroundColor = UIColor.gray.withAlphaComponent(overlayAlpha)
//        UIView.commitAnimations()
    }

    func dismissLoadingInView() {
        self.viewWithTag(loadingViewIndicatorTagValue)?.removeFromSuperview()
    }
}
