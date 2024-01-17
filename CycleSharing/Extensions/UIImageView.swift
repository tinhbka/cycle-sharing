import UIKit
import Foundation
import SDWebImage

extension UIImageView {
    func setImage(urlString: String?, placeholder: UIImage? = nil) {
        let placeImg = placeholder ?? UIColor.random.imageRepresentation
        self.sd_setImage(with: URL(string: urlString ?? ""), placeholderImage: placeImg)
    }

    func setCircle() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = false
        self.layer.backgroundColor = UIColor.white.cgColor
        self.clipsToBounds = true
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        let colors: [UIColor] = [.white]
        let colorRan = colors.randomElement()
        return colorRan!
    }

    var imageRepresentation: UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(self.cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image!
    }
}
