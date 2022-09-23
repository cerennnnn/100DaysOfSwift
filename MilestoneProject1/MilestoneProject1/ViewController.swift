//
//  ViewController.swift
//  MilestoneProject1
//
//  Created by Ceren Güneş on 22.09.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            flags.append(item)
        }
        print(items)
    }
    
    //    returns the number of cells that are going to be created
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flags", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row]
        return cell
    }
}

