//
//  CountryCell.swift
//  Country Info
//
//  Created by Artem on 20.10.2021.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet var countryFlagImage: ImageView!
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var countryCapitalLabel: UILabel!
    
    func configure (with country: Country) {
        countryNameLabel.text = country.name ?? "Country not found"
        countryCapitalLabel.text = country.capital ?? "Capital not found"
        countryFlagImage.fetchData(with: country.flags?.png)
        
    }
}



