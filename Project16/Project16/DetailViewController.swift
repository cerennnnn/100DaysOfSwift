//
//  DetailViewController.swift
//  Project16
//
//  Created by Ceren Güneş on 14.12.2023.
//

import UIKit
import WebKit 

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var cityName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let cityName = cityName else { return }
        guard let url = URL(string: "https://en.wikipedia.org/wiki/\(cityName)") else { return }
     
        webView.load(URLRequest(url: url))
        
    }

}
