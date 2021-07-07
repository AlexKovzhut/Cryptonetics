//
//  NetworkManager.swift
//  Cryptonetics
//
//  Created by Alexander Kovzhut on 07.07.2021.
//

import Foundation

class NetworkManager {
    
    static func fetchData(url: String, completion: @escaping (_ currency: CurrencyData) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let currency = try decoder.decode(CurrencyData.self, from: data)
                completion(currency)
            } catch let error {
                error
            }
    }.resume()
    }
}
