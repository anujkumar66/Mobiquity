//
//  HelpViewController.swift
//  Assignment
//

import UIKit
import WebKit

class HelpViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var wkWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = URLRequest(url: URL(string: Constants.helpUrl)!)
        wkWebView.navigationDelegate = self
        wkWebView.load(request)
    }
}
