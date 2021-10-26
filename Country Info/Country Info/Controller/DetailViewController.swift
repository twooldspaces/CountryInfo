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
    @IBOutlet var countryRegionLabel: UILabel!
    @IBOutlet var countryPopulationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryNameLabel.text = country.name ?? "country not found"
        countryCapitalLabel.text = country.capital ?? "capital not found"
        countryPopulationLabel.text = "Population: \(String(country.population ?? 0)) people"
        countryRegionLabel.text = "Region: \(country.region ?? "not found")"
        countryFlagImageView.fetchData(with: country.flags?.png)
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0,
                                     width: self.view.bounds.size.width,
                                     height: self.view.bounds.size.height)
    }
    
 
    //  MARK: - Gradient
     
     var gradientLayer: CAGradientLayer! {
         didSet {
             gradientLayer.startPoint = CGPoint(x: 1, y: 0)
             gradientLayer.endPoint = CGPoint(x: 1, y: 1)
             let startColor = #colorLiteral(red: 0.5471723205, green: 0.5907870392, blue: 0.7047743318, alpha: 1).cgColor
             let endColor = #colorLiteral(red: 0.4412922462, green: 0.3671935903, blue: 0.9686274529, alpha: 1).cgColor
             gradientLayer.colors = [startColor, endColor]
             gradientLayer.locations = [0.5, 1]

         }
     }
    

}
