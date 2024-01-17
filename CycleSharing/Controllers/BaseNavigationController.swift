//
//  BaseNavigationController.swift
//  Anista
//
//  Created by nguyen.ngoc.ban on 23/05/2022.
//

import UIKit

class CustomNavigationBar: UINavigationBar {

    static var customHeight: CGFloat {
        return 44
    }

    var customHeight: CGFloat {
        CustomNavigationBar.customHeight
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: customHeight)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        guard customHeight != 44 else {
            return
        }
        for subview in self.subviews {
            var stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("UIBarBackground") {
                subview.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: customHeight)
                subview.sizeToFit()
            }
            stringFromClass = NSStringFromClass(subview.classForCoder)

            // Can't set height of the UINavigationBarContentView
            if stringFromClass.contains("UINavigationBarContentView") {
                // Set Center Y
                let centerY = (customHeight - subview.frame.height) / 2.0
                subview.frame = CGRect(x: 0, y: centerY, width: self.frame.width, height: subview.frame.height)
                subview.sizeToFit()
            }
        }
    }
}

class BaseNavigationController: UINavigationController {

    static func create(rootViewController: UIViewController) -> BaseNavigationController {
        let navi = BaseNavigationController(navigationBarClass: CustomNavigationBar.self, toolbarClass: nil)
        navi.viewControllers = [rootViewController]
        return navi
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }

    func setupNavigation() {
        if #available(iOS 15.0, *) {
            let appearance = navigationBar.standardAppearance
            appearance.backgroundColor = UIColor.white
            appearance.backgroundImage = UIImage()
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                              NSAttributedString.Key.font: UIFont.robotoMedium.withSize(18)]
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        } else {
            navigationBar.barTintColor = UIColor.white
            navigationBar.shadowImage = UIImage()
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                 NSAttributedString.Key.font: UIFont.robotoMedium.withSize(18)]
        }
        navigationBar.tintColor = UIColor.black
        navigationBar.isTranslucent = true
    }
}
