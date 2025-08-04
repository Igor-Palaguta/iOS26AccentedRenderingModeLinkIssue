//
//  ViewController.swift
//  iOS26AccentedRenderingModeLinkIssue
//
//  Created by Igor Palaguta on 04/08/2025.
//

import UIKit

final class ViewController: UIViewController {
    var url: URL? {
        didSet {
            informationLabel?.text = url?.absoluteString
        }
    }

    @IBOutlet private var informationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        informationLabel.text = url?.absoluteString ?? "No URL"
    }
}
