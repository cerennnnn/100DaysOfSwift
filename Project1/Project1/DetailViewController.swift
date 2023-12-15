//
//  DetailViewController.swift
//  Project1
//
//  Created by Ceren Güneş on 1.12.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    var selectedImageNumber: Int?
    var totalImages: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage, let currentImage = selectedImageNumber, let total = totalImages {
            imageView.image = UIImage(named: imageToLoad)
            title = "Picture \(currentImage) of \(total)"
        }
        
        assert(selectedImage != nil, "Image successfully loaded -> \(selectedImage))")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
