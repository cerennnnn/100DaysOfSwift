//
//  ViewController.swift
//  Milestone4
//
//  Created by Ceren Güneş on 9.12.2023.
//

import UIKit

class ViewController: UITableViewController {
    
    var photos = [Photo]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Photos"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPhoto))
        
        loadPhotos()
    }
    
    private func loadPhotos() {
          if let savedPhotos = defaults.object(forKey: "photos") as? Data {
              let jsonDecoder = JSONDecoder()
              
              do {
                  photos = try jsonDecoder.decode([Photo].self, from: savedPhotos)
              } catch {
                  print("Failed to load photos.")
              }
          }
        tableView.reloadData()
      }
    
    @objc func addPhoto() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let photo = photos[indexPath.row]
        let path = getDocumentsDirectory().appendingPathComponent(photo.fileName)
        
        cell.imageView?.image = UIImage(contentsOfFile: path.path)
        cell.textLabel?.text = photo.caption
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        updateCaption(for: indexPath.row)
    }
}

extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let photo = Photo(caption: "Caption", fileName: imageName)
        photos.append(photo)
        save()
        
        updateCaption(for: photos.count - 1)
        
        dismiss(animated: true)
    }
    
    private func updateCaption(for index: Int) {
        let selectedPhoto = photos[index]
        let ac = UIAlertController(title: "Add caption", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self, weak ac] _ in
            guard let self = self else { return }
            guard let caption = ac?.textFields?[0].text else { return }
            
            self.photos[index].caption = caption
            self.save()
            self.tableView.reloadData()
        }))
    
        ac.addAction(UIAlertAction(title: "Go to next page", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            let photo = self.photos[index]
            let path = getDocumentsDirectory().appendingPathComponent(photo.fileName)
            
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                vc.caption = selectedPhoto.caption
                vc.imageName = UIImage(contentsOfFile: path.path)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }))
        
        present(ac, animated: true)
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func save() {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(photos) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "photos")
        } else {
            print("Failed to save photos.")
        }
        tableView.reloadData()
    }
}
