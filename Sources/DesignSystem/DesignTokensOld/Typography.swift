import SwiftUI

extension Font {
    // we can not use "body" as the name of the property because the previews don't work
    // although the app worked fine 🤷🏻‍♂️
    static let bodyFont = Font.custom("Roboto", size: 16)
}

extension UIFont {
    static let body = UIFont(name: "Roboto", size: 16) ?? .systemFont(ofSize: 16)
}
