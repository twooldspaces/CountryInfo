//
//  MainViewController.swift
//  Country Info
//
//  Created by Artem on 20.10.2021.
//

import UIKit

class MainViewController: UITableViewController {
 
    
    @IBOutlet var searchBar: UITableView!
        
    var countries: [Country]! = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        tableView.rowHeight = 100
        
        NetworkManager.shared.fetchData { (country) in
            if let countries = country {
            self.countries = countries
            self.tableView.reloadData()
            }
        }
        
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryCell
        let country = countries[indexPath.row]
        cell.configure(with: country)
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    // MARK: - Navigation
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToDetailVC" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailViewController
                detailVC.country = countries[indexPath.row]
            }
        }
    }
    

    
}


