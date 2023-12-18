//
//  DetailViewController.swift
//  Milestone7
//
//  Created by Ceren Güneş on 18.12.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var noteContent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let content = noteContent {
            textView.text = content
        }
    }
}
