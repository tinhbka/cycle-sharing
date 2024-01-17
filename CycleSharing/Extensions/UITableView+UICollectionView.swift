import Foundation
import UIKit

extension UITableView {

    func registerNibCell<T: UITableViewCell>(type: T.Type) {
        register(UINib.nib(fromClass: type), forCellReuseIdentifier: String(describing: type))
    }

    func registerNibHeaderFooter<T: UITableViewHeaderFooterView>(type: T.Type) {
        register(UINib.nib(fromClass: type), forHeaderFooterViewReuseIdentifier: String(describing: type))
    }

    func dequeueReusableNibCell<T: UITableViewCell>(type: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: String(describing: type)) as? T
    }

    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>(type: T.Type) -> T? {
        return dequeueReusableHeaderFooterView(withIdentifier: String(describing: type)) as? T
    }

}

extension UICollectionView {

    func registerNibCell<T: UICollectionViewCell>(type: T.Type) {
        register(UINib.nib(fromClass: type), forCellWithReuseIdentifier: String(describing: type))
    }

    func dequeueReusableNibCell<T: UICollectionViewCell>(type: T.Type, atIndex: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: String(describing: type), for: atIndex) as? T
    }

    func registerHeaderNib<T: UICollectionReusableView>(type: T.Type) {
        register(UINib.nib(fromClass: type), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: String(describing: type))
    }

    func dequeueReusableHeaderNib<T: UICollectionReusableView>(type: T.Type, atIndex: IndexPath) -> T? {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: String(describing: type), for: atIndex) as? T
    }

    func estimateCellSizeSmall() {
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
}

extension UIScrollView {

    // Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view: UIView, animated: Bool) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            // Scroll to a rectangle starting at the Y of your subview, with a height of the scrollview
            self.scrollRectToVisible(CGRect(x: 0, y: childStartPoint.y, width: 1, height: self.frame.height),
                                     animated: animated)
        }
    }

}
