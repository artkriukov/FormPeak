//
//  ViewController.swift
//  FormPeak
//
//  Created by Artem Kriukov on 18.12.2025.
//

import UIKit

final class ViewController: UIViewController {
    private lazy var input = SegmentedControlFactories.makeSegmentedButtonsView(
        title: "Title",
        selected: AttemptEffort.easy
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        view.addSubview(input)
        view.backgroundColor = AppColor.background
//        input.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            input.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            input.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            input.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//            input.heightAnchor.constraint(equalToConstant: Layout.rowHeight)
        ])
    }
}
