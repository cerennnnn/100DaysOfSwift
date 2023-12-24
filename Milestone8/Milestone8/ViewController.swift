//
//  ViewController.swift
//  Milestone8
//
//  Created by Ceren Güneş on 24.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var topText: String?
    var bottomText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Meme Generator"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: ["Share this app with others!"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    @IBAction func importPictureTapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @IBAction func setTopTextTapped(_ sender: Any) {
        let ac = UIAlertController(title: "Enter top text", message: nil, preferredStyle: .alert)
        ac.addTextField { text in
            text.placeholder = "Top text here"
        }
        
        ac.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            if let textField = ac.textFields?.first, let text = textField.text {
                self?.drawImagesAndText(topText: text)
            }
        })
        
        present(ac, animated: true)
    }
    
    @IBAction func setBottomTextTapped(_ sender: Any) {
        let ac = UIAlertController(title: "Enter bottom text", message: nil, preferredStyle: .alert)
        ac.addTextField { text in
            text.placeholder = "Bottom text here"
        }
        
        ac.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            if let textField = ac.textFields?.first, let text = textField.text {
                self?.drawImagesAndText(bottomText: text)
            }
        })
        
        present(ac, animated: true)
    }
    
    func drawImagesAndText(topText: String? = nil, bottomText: String? = nil) {
        guard let existingImage = imageView.image else {
            return
        }
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { ctx in
            existingImage.draw(in: CGRect(x: 0, y: 0, width: 512, height: 512))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 36, weight: .bold),
                .foregroundColor: UIColor.white,
                .paragraphStyle: paragraphStyle
            ]
            
            if let topText = topText {
                let topString = NSAttributedString(string: topText, attributes: attrs)
                let textSize = topString.size()
                let topTextRect = CGRect(x: (512 - textSize.width) / 2, y: 10, width: textSize.width, height: 50)
                topString.draw(with: topTextRect, options: .usesLineFragmentOrigin, context: nil)
            }
            
            if let bottomText = bottomText {
                let bottomString = NSAttributedString(string: bottomText, attributes: attrs)
                bottomString.draw(with: CGRect(x: 0, y: 462, width: 512, height: 50), options: .usesLineFragmentOrigin, context: nil)
            }
        }
        
        imageView.image = image
    }
    
}

extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func getImage(with image: UIImage) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let newImage = renderer.image { ctx in
            
            let borderRect = CGRect(x: 0, y: 0, width: 512, height: 512)
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            ctx.cgContext.fill(borderRect)
            
            let imageRect = CGRect(x: 10, y: 10, width: 492, height: 492)
            image.draw(in: imageRect)
            
        }
        
        return newImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let newImage = getImage(with: image)
        self.imageView.image = newImage
        
        dismiss(animated: true)
    }
}
