//
//  MainViewController.swift
//  Country Info
//
//  Created by Artem on 20.10.2021.
//

import UIKit

class MainViewController: UITableViewController {
    
    var countries: [Country] = []
    let url = "https://restcountries.com/v2/all"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchData(for: url) { (launch) in
            if let countries = launch {
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
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
