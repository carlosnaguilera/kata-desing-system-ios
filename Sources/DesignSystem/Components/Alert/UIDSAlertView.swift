import UIKit

public final class UIDSAlertView: UIView {

    public var buttonTapHandler: (() -> Void)?

    private let kind: AlertKind
    private let message: String

    private let iconView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.adjustsImageSizeForAccessibilityContentSizeCategory = true
        return view
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont.body)
        label.numberOfLines = 0
        label.textAlignment = .natural
        return label
    }()

    private lazy var closeButton: UIButton = {
        let action = UIAction { [weak self] _ in
            self?.buttonTapHandler?()
        }
        let button = UIButton(type: .custom, primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(resource: .cross), for: .normal)
        return button
    }()

    /// Creates an alert view with the specified kind and message.
    /// - Parameters:
    ///   - kind: kind of alert. Depending on the kind, the icon and the color of the alert will be set.
    ///   - message: message to be displayed in the alert.
    public init(kind: AlertKind, message: String) {
        self.kind = kind
        self.message = message
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {

        backgroundColor = kind.backgroundColor
        layer.cornerRadius = CornerRadius.medium
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: Spacing.medium, leading: Spacing.extraLarge, bottom: Spacing.medium, trailing: Spacing.extraLarge)

        iconView.image = kind.icon.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = kind.textColor

        label.text = "\(kind.text): \(message)"
        label.textColor = kind.textColor

        [iconView, label, closeButton].forEach(addSubview)

        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            iconView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),

            label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: Spacing.large),
            label.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),

            closeButton.leadingAnchor.constraint(greaterThanOrEqualTo: label.trailingAnchor, constant: Spacing.large),
            closeButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            closeButton.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
        ])

    }
}

private extension AlertKind {

    var backgroundColor: UIColor {

        switch self {
        case .error:
            return .errorBackground
        case .success:
            return .successBackground
        case .notification:
            return .notificationBackground
        }
    }

    var icon: UIImage {

        switch self {
        case .error:
            return UIImage(resource: .error)
        case .success:
            return UIImage(resource: .success)
        case .notification:
            return UIImage(resource: .bell)
        }
    }

    var textColor: UIColor {

        switch self {
        case .error:
            return .errorText
        case .success:
            return .successText
        case .notification:
            return .notificationText
        }
    }
}
