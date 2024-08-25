import SwiftUI
import UIKit

public extension UIImage {
    static let notification = UIImage(resource: .bell)
    static let error = UIImage(resource: .error)
    static let success = UIImage(resource: .success)
    static let cross = UIImage(resource: .cross)
}

public extension Image {
    static let notification = Image(.bell)
    static let error = Image(.error)
    static let success = Image(.success)
    static let cross = Image(.cross)
}
