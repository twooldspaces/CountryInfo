//
//  NetworkService.swift
//  Country Info
//
//  Created by Artem on 20.10.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData(for url: String, complition: @escaping ([Country]?) -> ()) {
        guard let url = URL(string: url) else { return }
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

