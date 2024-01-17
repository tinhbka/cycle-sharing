

import UIKit
import RxSwift

class BaseVC: UIViewController {

    let refreshControl = UIRefreshControl()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    public func showAlert(title: String, message: String) {
        // create the alert
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
    }

    public func showAlert(message: String, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            completion()
        }))
        self.present(alert, animated: true, completion: nil)
    }

    public func showAlert(title: String, message: String, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            completion()
        }))
        self.present(alert, animated: true, completion: nil)
    }

    func showLoading() {
        AppUtils.shared.showLoading()
    }

    func hideLoading() {
        AppUtils.shared.hideLoading()
    }

    deinit {
        print("Deinit \(self.description)")
    }
}

extension BaseVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
