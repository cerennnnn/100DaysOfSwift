//
//  ViewController.swift
//  Milestone2
//
//  Created by Ceren Güneş on 5.12.2023.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(emptyShoppingList))
        
        
    }


    @objc func addItem() {
        let ac = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        ac.addTextField { text in
            text.placeholder = "Add item to your shopping list!"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default, handler: { [weak self, weak ac] _ in
            guard let item = ac?.textFields?[0].text else { return }
            
            self?.shoppingList.insert(item, at: 0)
            self?.tableView.reloadData()
        })
        
        ac.addAction(addAction)
        present(ac, animated: true)
    }
    
    @objc func emptyShoppingList() {
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "List", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }
}

