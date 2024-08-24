import Foundation

public enum AlertKind: CaseIterable {

    case error
    case success
    case notification
}

extension AlertKind {

    var text: String {

        switch self {
        case .error:
            String(localized: "Error", comment: "Error alert kind title")
        case .success:
            String(localized: "Success", comment: "Success alert kind title")
        case .notification:
            String(localized: "Notification", comment: "Notification alert kind title")
        }
    }
}
