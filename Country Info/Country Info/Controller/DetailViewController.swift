//
//  DetailViewController.swift
//  Country Info
//
//  Created by Artem on 20.10.2021.
//

import UIKit

class DetailViewController: UIViewController {

    var country: Country!
    
    @IBOutlet var countryFlagImageView: ImageView!
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var countryCapitalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryNameLabel.text = country.name ?? "country not found"
        countryCapitalLabel.text = country.capital ?? "capital not found"
        countryFlagImageView.fetchData(with: country.flags?.png)
        
    }
    
    
    

}
