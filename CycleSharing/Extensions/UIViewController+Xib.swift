import UIKit

enum ViewControllerAddType {
    case present
    case push
}

extension UIViewController {
    static func instantiate(fromVoicyStoryboard storyboard: UIStoryboard = UIStoryboard(name: "Main",
                                                                                        bundle: nil)) -> Self {
        return storyboard.getViewControllerFromClass(self)
    }

    class func getXibVC() -> Self {
        return getXibViewController(self)
    }

    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

private func getXibViewController<T: UIViewController>(_ viewControllerClassName: T.Type) -> T {
    let name = String(describing: T.self)
    if Bundle.main.path(forResource: name, ofType: "nib") == nil
        && Bundle.main.path(forResource: name, ofType: "xib") == nil {
        fatalError("\(name) is not registed")
    }
    return T(nibName: name, bundle: nil)
}

extension UIStoryboard {
    func getViewControllerFromClass< T: UIViewController>(_ viewControllerType: T.Type) -> T {
        let viewControllerId = String(describing: viewControllerType)
        guard let vc = self.instantiateViewController(withIdentifier: viewControllerId) as? T else {
            fatalError("Can't load viewcontroller with identifier: \(viewControllerId) from storyboard \(#file)")
        }
        return vc
    }
}

extension UIViewController {
    func presentLikePush(_ viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        present(viewController, animated: false)
    }

    func dismissLikePop(animated: Bool = true) {
        if animated {
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            self.view.window!.layer.add(transition, forKey: kCATransition)
            dismiss(animated: false)
        } else {
            dismiss(animated: false)
        }
    }
}

extension UINavigationController {
    func pushVC(vc: UIViewController, type: ViewControllerAddType) {
        self.popToRootViewController(animated: true)
        self.dismiss(animated: false, completion: nil)
        if type == .present {
            self.presentLikePush(vc)
        } else {
            self.pushViewController(vc, animated: true)
        }
    }
}

extension UIViewController {
     var appDelegate: AppDelegate {
         return UIApplication.shared.delegate as! AppDelegate
     }

     var sceneDelegate: SceneDelegate? {
         guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
             let delegate = windowScene.delegate as? SceneDelegate else { return nil }
          return delegate
     }
}
