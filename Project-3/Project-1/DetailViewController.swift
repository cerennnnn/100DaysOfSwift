//
//  DetailViewController.swift
//  Project-1
//
//  Created by Ceren Güneş on 14.09.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedIndex: Int = 0
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
//        title = selectedImage
        title = "Picture \(selectedIndex + 1) of \(count)"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        navigationItem.largeTitleDisplayMode = .never
        
//        checks and unwraps the optional in selected image if it's nil the code inside will never get executed.
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
            
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found.")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }
    
}
