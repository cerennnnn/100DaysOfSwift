//
//  DetailViewController.swift
//  Milestone5
//
//  Created by Ceren Güneş on 12.12.2023.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryStatusLabel: UILabel!
    @IBOutlet weak var countryPopulationLabel: UILabel!
    @IBOutlet weak var countryDetailLabel: UILabel!
    
    private var countryImage: String?
    private var countryName: String?
    private var countryStatus: String?
    private var countryPopulation: String?
    private var countryDetail: String?
    public var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let country {
            countryImageView.sd_setImage(with: URL(string: country.countryFlag))
            countryNameLabel.text = country.countryName.uppercased()
            countryStatusLabel.text = country.countryCode
            countryPopulationLabel.text = "\(country.countryPopulation)"
            countryDetailLabel.text = country.countryDetail
        }
    }
    
}
