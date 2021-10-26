//
//  NetworkService.swift
//  Country Info
//
//  Created by Artem on 20.10.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData(complition: @escaping ([Country]?) -> ()) {
        let urlString = "https://restcountries.com/v2/all"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let jsonData = data else { return }
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode([Country].self, from: jsonData)
                
                DispatchQueue.main.async {
                    complition(countries)
                }
            } catch let error {
                print("error: ", error)
            }
        }.resume()
    }
}

