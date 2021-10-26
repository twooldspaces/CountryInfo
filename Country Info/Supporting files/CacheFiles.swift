//
//  CacheFiles.swift
//  Country Info
//
//  Created by Artem on 20.10.2021.
//

import UIKit

class ImageView: UIImageView {

    func fetchData (with url: String?) {
        guard let url = url else { return }
        guard let imageUrl = URL(string: url) else {
            image = UIImage(systemName: "nosign")
            return
        }
        
        // если изображение есть в кэше
        if let cachedImage = getCachedImage(url: imageUrl) {
            image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if let error = error {print(error); return }
            guard let data = data, let response = response else { return }
            guard let responseUrl = response.url else { return }
            
            if responseUrl.absoluteString != url { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
            // сохраняем в кэше
            self.saveImageToCache(data: data, response: response)
            
        }.resume()
        
    }
    
    // сохраняет изображение с типом Data
    private func saveImageToCache(data: Data, response: URLResponse) {
        guard let responseUrl = response.url else { return }
        let cacheResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cacheResponse, for: URLRequest(url: responseUrl))
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
        if let cacheResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return UIImage(data: cacheResponse.data)
        }
        return nil
    }
    
}
