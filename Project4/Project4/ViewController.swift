//
//  ViewController.swift
//  Project4
//
//  Created by Ceren Güneş on 3.12.2023.
//

import UIKit
import WebKit

//delegation -> a programming pattern, a way of writing code
//a delegate is one thing acting in place of another, answering questions and responding to events on its behalf.

class ViewController: UITableViewController {
    
    let urls = ["apple.c", "hackingwithswift.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Easy Browser"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urls.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = urls[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            vc.cellURL = urls[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
