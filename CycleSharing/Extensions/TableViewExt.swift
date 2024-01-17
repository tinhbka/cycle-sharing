//
//  TableViewExt.swift
//  CycleSharing
//
//  Created by Tinh Vu on 12/01/2024.
//

import Foundation
import UIKit

extension NSObject {

    class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    
    /// Name of object class in string.
    ///
    /// - Returns: Class name in string.
    class func identifier() -> String {
        return String(describing: self)
    }

}


// UITableView register helper
protocol UITableViewProperty {}
extension UITableViewCell: UITableViewProperty {}
extension UITableViewHeaderFooterView: UITableViewProperty {}


// MARK: - UITableView

extension UITableView {
    
    /// Register table cells or headers/footers by given class.
    ///
    /// - Parameter aClass: UITableViewCell class.
    func register(_ types: UITableViewProperty.Type...) {
        for type in types {
            switch type {
            case let c as UITableViewHeaderFooterView.Type:
                self.register(c, forHeaderFooterViewReuseIdentifier: c.className)
                
            case let c as UITableViewCell.Type:
                self.register(c, forCellReuseIdentifier: c.className)
                
            default: break
            }
        }
    }
    
    func registerNib(_ types: UITableViewProperty.Type...) {
        for type in types {
            switch type {
            case let c as UITableViewHeaderFooterView.Type:
                self.register(UINib(nibName: c.className, bundle: nil), forHeaderFooterViewReuseIdentifier: c.className)
                
            case let c as UITableViewCell.Type:
                self.register(UINib(nibName: c.className, bundle: nil), forCellReuseIdentifier: c.className)
                
            default: break
            }
        }
    }
    
    /// Dequeue cell by given UITableViewCell class
    ///
    /// - Parameters:
    ///   - fromClass: UITableViewCell class.
    ///   - indexPath: Index path of cell.
    /// - Returns: Dequeued cell.
    func dequeue<T: UITableViewCell>(cell fromClass: T.Type, at indexPath: IndexPath) -> T {
        let cell = self.dequeueReusableCell(withIdentifier: fromClass.className, for: indexPath) as! T
        return cell
    }
    
    /// Dequeue table header/footer view by given UITableViewHeaderFooterView class.
    ///
    /// - Parameter fromClass: UITableViewHeaderFooterView class.
    /// - Returns: Dequeued table header/footer view.
    func dequeue<T: UITableViewHeaderFooterView>(view fromClass: T.Type) -> T {
        return self.dequeueReusableHeaderFooterView(withIdentifier: fromClass.className) as! T
    }
    
    /// Insert section to table view.
    ///
    /// - Parameters:
    ///   - section: Section to be inserted.
    ///   - animation: Animation of inserting.
    func insertSection(_ section: Int, with animation: UITableView.RowAnimation) {
        self.insertSections(IndexSet(integer: section), with: animation)
    }
    
    /// Insert sections to table view.
    ///
    /// - Parameters:
    ///   - section: Sections to be inserted.
    ///   - animation: Animation of inserting.
    func insertSections(_ sections: [Int], with animation: UITableView.RowAnimation) {
        self.insertSections(IndexSet(sections), with: animation)
    }
    
    /// Delete section from table view.
    ///
    /// - Parameters:
    ///   - section: Section to be deleted.
    ///   - animation: Animation of deleting.
    func deleteSection(_ section: Int, with animation: UITableView.RowAnimation) {
        self.deleteSections(IndexSet(integer: section), with: animation)
    }
    
    /// Delete sections from table view.
    ///
    /// - Parameters:
    ///   - section: Sections to be deleted.
    ///   - animation: Animation of deleting.
    func deleteSections(_ sections: [Int], with animation: UITableView.RowAnimation) {
        self.deleteSections(IndexSet(sections), with: animation)
    }
    
    /// Reload section from table view.
    ///
    /// - Parameters:
    ///   - section: Section to be reloaded.
    ///   - animation: Animation of reloading.
    func reloadSection(_ section: Int, with animation: UITableView.RowAnimation) {
        self.reloadSections(IndexSet(integer: section), with: animation)
    }
    
    /// Reload sections in table view.
    ///
    /// - Parameters:
    ///   - section: Sections to be reloaded.
    ///   - animation: Animation of reloading.
    func reloadSections(_ sections: [Int], with animation: UITableView.RowAnimation) {
        self.reloadSections(IndexSet(sections), with: animation)
    }
    
}


// MARK: - UITableViewCell

extension UITableViewCell {
    
    /// Return a blank cell.
    static var empty: UITableViewCell {
        return UITableViewCell()
    }
}
