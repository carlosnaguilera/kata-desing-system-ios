import SwiftUI

public struct DSAlertView: View {
    
    /// Creates an alert view with the specified kind and message.
    /// - Parameters:
    ///   - kind: kind of alert. Depending on the kind, the icon and the color of the alert will be set.
    ///   - message: message to be displayed in the alert.
    public init(kind: AlertKind, message: String) {
        self.kind = kind
        self.message = message
    }

    private let kind: AlertKind
    private let message: String

    @Environment(\.dismiss) var dismiss
    @Environment(\.layoutDirection) var direction

    private var text: String {
        direction == .leftToRight ? "\(kind.text): \(message)" : "\(message) :\(kind.text)"
    }

    public var body: some View {
        HStack {
            HStack(spacing: 16) {
                kind.icon.renderingMode(.template)
                Text(text)
                    .font(.custom("Roboto", size: 16))
            }
            .foregroundStyle(kind.mainColor)
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(.cross)
            }
        }
        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
        .background(kind.backgroundColor)
        .cornerRadius(8)
    }
}

private extension AlertKind {

    var icon: Image {

        switch self {
        case .error:
            Image(.error)
        case .success:
            Image(.success)
        case .notification:
            Image(.bell)
        }
    }

    var mainColor: Color {

        switch self {
        case .error:
            Color(red: 240.0 / 255.0, green: 61.0 / 255.0, blue: 62.0 / 255.0)
        case .success:
            Color(red: 0.0 / 255.0, green: 123.0 / 255.0, blue: 64.0 / 255.0)
        case .notification:
            Color(red: 216.0 / 255.0, green: 73.0 / 255.0, blue: 16.0 / 255.0)
        }
    }

    var backgroundColor: Color {
        mainColor.opacity(0.1)
    }
}

#Preview("Left to right") {
    let view: some View = Group {
        DSAlertView(kind: .error, message: "Error message")
        DSAlertView(kind: .success, message: "Success message")
        DSAlertView(kind: .notification, message: "Notification message")
    }
    return view.environment(\.layoutDirection, .leftToRight)


}

#Preview("Right to left") {
    Group {
        DSAlertView(kind: .error, message: "error messagE")
        DSAlertView(kind: .success, message: "success messagE")
        DSAlertView(kind: .notification, message: "notification messagE")
    }
    .environment(\.layoutDirection, .rightToLeft)
}
