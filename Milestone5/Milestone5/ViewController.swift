//
//  ViewController.swift
//  Milestone5
//
//  Created by Ceren Güneş on 12.12.2023.
//

import UIKit

class ViewController: UITableViewController {
    
    private var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Country"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        loadCountries()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    private func loadCountries() {
        guard let fileURL = Bundle.main.url(forResource: "Countries", withExtension: ""),
              let data = try? Data(contentsOf: fileURL) else {
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let data = try decoder.decode(Countries.self, from: data)
            countries = data.countries
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = countries[indexPath.row].countryName
        cell.imageView?.sd_setImage(with: URL(string: countries[indexPath.row].countryFlag))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = countries[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "detail", sender: selectedCountry)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail", let destinationVC = segue.destination as? DetailViewController {
            if let selectedCountry = sender as? Country {
                destinationVC.country = selectedCountry   
            }
        }
    }
}
