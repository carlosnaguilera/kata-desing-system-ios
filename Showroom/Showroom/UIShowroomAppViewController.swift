//
//  UIShowroomAppViewController.swift
//  Showroom-UIKit
//
//  Created by Carlos Núñez Aguilera on 25/8/24.
//

import UIKit

final class UIShowroomAppViewController: UIViewController {

    private let showroomAppView = UIShowroomAppView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {

        view.addSubview(showroomAppView)
        view.backgroundColor = .systemBackground

        NSLayoutConstraint.activate([
            showroomAppView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showroomAppView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            showroomAppView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

}
