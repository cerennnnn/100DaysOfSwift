//
//  ViewController.swift
//  Project1
//
//  Created by Ceren Güneş on 1.12.2023.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [Picture]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        performSelector(inBackground: #selector(loadFromBundle), with: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @objc func loadFromBundle() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items.sorted() {
            if item.hasPrefix("nssl") {
                pictures.append(Picture(name: item, counter: 0))
            }
        }
    }
    
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: ["Share this app with others!"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        guard let data = defaults.data(forKey: "counter"), let decodedPictures = try? JSONDecoder().decode([Picture].self, from: data) else { fatalError() }
        pictures = decodedPictures
        
        
        cell.textLabel?.text = pictures[indexPath.row].name
        cell.detailTextLabel?.text = "\(decodedPictures[indexPath.row].counter)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var flag = pictures[indexPath.row]
        flag.counter += 1
        
        pictures[indexPath.row] = flag
        
        let encodedData = try? JSONEncoder().encode(pictures)
        defaults.set(encodedData, forKey: "counter")
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row].name
            vc.totalImages = pictures.count
            vc.selectedImageNumber = indexPath.row + 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

