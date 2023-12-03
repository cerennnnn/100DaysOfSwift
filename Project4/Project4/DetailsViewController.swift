//
//  DetailsViewController.swift
//  Project4
//
//  Created by Ceren Güneş on 3.12.2023.
//

import UIKit
import WebKit

//delegation -> a programming pattern, a way of writing code
//a delegate is one thing acting in place of another, answering questions and responding to events on its behalf.

class DetailsViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var progressView: UIProgressView!
    var cellURL: String?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let refresher = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        let back = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: webView, action: #selector(webView.goBack))
        let forward = UIBarButtonItem(image: UIImage(systemName: "chevron.right"), style: .done, target: webView, action: #selector(webView.goForward))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [back, progressButton, spacer, refresher, forward]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        //observer -> ViewController
        //we wanna observe webview's estimatedProgress prooperty
        //we want the new value that was just set
        
        guard let cellURL = cellURL else { return }
        guard let url = URL(string: "https://\(cellURL)") else {
            let ac = UIAlertController(title: "Error", message: "Website is blocked.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: openPage(action:)))
            present(ac, animated: true)
            
            return
        }
        
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    @objc func openTapped() {
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        guard let actionTitle = action.title else { return }
        
        guard let url = URL(string: "https://" + actionTitle) else {
            let ac = UIAlertController(title: "Error!", message: "The URL is not allowed,", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Close", style: .cancel, handler: openPage(action:)))
            present(ac, animated: true)
            return
        }
        
        webView.load(URLRequest(url: url))
    }

    //called when the webview finished loading its page
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
}

