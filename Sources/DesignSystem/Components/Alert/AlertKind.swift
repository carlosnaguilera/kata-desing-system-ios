import Foundation

enum AlertKind: CaseIterable {
    case error
    case success
    case notification
}

extension AlertKind {

    // TODO: Replace with localized strings
    var text: String {

        switch self {
        case .error:
            return "Error"
        case .success:
            return "Success"
        case .notification:
            return "Notification"
        }
    }
}
