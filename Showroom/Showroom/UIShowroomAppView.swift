//
//  UIShowroomAppView.swift
//  Showroom-UIKit
//
//  Created by Carlos Núñez Aguilera on 25/8/24.
//

import UIKit
import DesignSystem

final class UIShowroomAppView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UIKit"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    private let alertLabel: UILabel = {
        let label = UILabel()
        label.text = "Alerts"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    private let alertsView: UIView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        AlertKind.allCases.forEach { kind in
            let alertView = UIDSAlertView(kind: kind, message: "Message")
            stackView.addArrangedSubview(alertView)
        }
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {

        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        [titleLabel, alertLabel, alertsView].forEach(addSubview)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            alertLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            alertLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            alertLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            alertsView.topAnchor.constraint(equalTo: alertLabel.bottomAnchor, constant: 16),
            alertsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            alertsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            alertsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
