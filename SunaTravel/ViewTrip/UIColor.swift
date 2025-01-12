import UIKit
// MARK: - UIColor Helper
extension UIColor {
    convenience init(hex: String) {
        let hexNumber = Int(hex, radix: 16) ?? 0
        self.init(red: CGFloat((hexNumber >> 16) & 0xFF) / 255.0,
                  green: CGFloat((hexNumber >> 8) & 0xFF) / 255.0,
                  blue: CGFloat(hexNumber & 0xFF) / 255.0,
                  alpha: 1.0)
    }
}
