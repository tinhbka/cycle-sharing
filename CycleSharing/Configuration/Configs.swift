
import Foundation
import UIKit

func log(_ data: Any? = nil) {
    print("\(data ?? "nil")")
}

func logg(_ data: Any? = nil, _ file: String = #file, _ line: Int = #line, _ funcs: String = #function) {
    print("\(data ?? ""), file: \(file), line: \(line), func: \(funcs)")
}
