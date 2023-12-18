//
//  ViewController.swift
//  Milestone7
//
//  Created by Ceren Güneş on 18.12.2023.
//

import UIKit

class ViewController: UITableViewController {
    
    var notes: [Notes] = [Notes]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareNavigationBar()
        retriveSavedNotes()
    }
    
    private func retriveSavedNotes() {
        if let savedNotes = defaults.object(forKey: "notes") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                notes = try jsonDecoder.decode([Notes].self, from: savedNotes)
            } catch {
                print("Failed to load saved notes.")
            }
        }
    }
    
    private func save() {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(notes) {
            defaults.set(savedData, forKey: "notes")
        } else {
            print("Failed to save notes.")
        }
    }
    
    private func prepareNavigationBar() {
        let share = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashTapped))
        
        navigationItem.rightBarButtonItems = [add, share]
    }

    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: ["Share this app with others!"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }
    
    @objc func addTapped() {
        
        let ac = UIAlertController(title: "Add new note", message: nil, preferredStyle: .alert)
        
        ac.addTextField { text in
            text.placeholder = "Title"
        }
        
        ac.addTextField { text in
            text.placeholder = "Content"
        }
        
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            guard let title = ac.textFields?[0].text, let content = ac.textFields?[1].text else { return }
            
            let note = Notes(noteTitle: title, noteContent: content)
            self?.notes.append(note)
            self?.save()
            self?.tableView.reloadData()
        }))
        
        present(ac, animated: true)
    }
    
    @objc func trashTapped() {        
        let ac = UIAlertController(title: "Careful!", message: "Do you want to delete all notes?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            self?.notes.removeAll()
            self?.tableView.reloadData()
        }))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = notes[indexPath.row].noteTitle
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNote = notes[indexPath.row]
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.noteContent = selectedNote.noteContent
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


