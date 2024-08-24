import SwiftUI

extension Color {

    // We create these colors in case we can reuse them in other components apart from AlertView
    // to display errors, success or notifications
    // Otherwise they could be renamed to "errorAlertBackground", "errorAlertText", etc
    static var errorBackground: Color { Color(.error).opacity(0.1) }
    static var errorText: Color { Color(.error) }
    static var successBackground: Color { Color(.success).opacity(0.1) }
    static var successText: Color { Color(.success) }
    static var notificationBackground: Color { Color(.notification).opacity(0.1) }
    static var notificationText: Color { Color(.notification) }
}
