import SwiftUI

extension Color {

    // We create these colors in case we can reuse them in other components apart from AlertView
    // to display errors, success or notifications
    // Otherwise they could be renamed to "errorAlertBackground", "errorAlertText", etc
    static let errorBackground = Color(.error).opacity(0.1)
    static let errorText = Color(.error)
    static let successBackground = Color(.success).opacity(0.1)
    static let successText = Color(.success)
    static let notificationBackground = Color(.notification).opacity(0.1)
    static let notificationText = Color(.notification)
}
