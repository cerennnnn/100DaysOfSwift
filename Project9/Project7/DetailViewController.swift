//
//  DetailViewController.swift
//  Project7
//
//  Created by Ceren Güneş on 5.12.2023.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?

    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        view = webView
        
        guard let detailItem = detailItem else { return }
        
        let html = """
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style> body { font-size: 150%; } </style>
</head>
<body>
\(detailItem.body)
</body>
</html>
"""
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    

}
