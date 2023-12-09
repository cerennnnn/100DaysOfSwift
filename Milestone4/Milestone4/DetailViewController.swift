//
//  DetailViewController.swift
//  Milestone4
//
//  Created by Ceren Güneş on 9.12.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    var caption: String?
    var imageName: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let caption = caption, let imageName = imageName {
            captionLabel.text = caption
            imageView.image = imageName
        }
    }
}
