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
            HStack(spacing: Spacing.large) {
                kind.icon.renderingMode(.template)
                Text(text)
                    .font(.body)
            }
            .foregroundStyle(kind.textColor)
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(.cross)
            }
        }
        .padding(.horizontal, Spacing.extraLarge)
        .padding(.vertical, Spacing.medium)
        .background(kind.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: CornerRadius.medium))
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

    var textColor: Color {

        switch self {
        case .error:
            .errorText
        case .success:
            .successText
        case .notification:
            .notificationText
        }
    }

    var backgroundColor: Color {
        switch self {
        case .error:
            .errorBackground
        case .success:
            .successBackground
        case .notification:
            .notificationBackground
        }
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
