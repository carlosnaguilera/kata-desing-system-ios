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

    var body: some View {
        HStack {
            HStack(spacing: 16) {
                kind.icon.renderingMode(.template)
                Text("\(kind.text): \(message)")
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

#Preview {
    DSAlertView(kind: .success, message: "Success message")
}
