//
//  NetworkManager.swift
//  Cryptonetics
//
//  Created by Alexander Kovzhut on 07.07.2021.
//

import Foundation

class NetworkManager {
    
    static func fetchData(completion: @escaping (Result<[CurrencyData], Error>) -> Void) {
        guard let url = URL(string: "https://rest.coinapi.io/v1/assets/?apikey/\(APIKey.apiKey)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else { return }
            
            do {
                
                let decoder = JSONDecoder()
                
                let currency = try decoder.decode([CurrencyData].self, from: data)
                completion(.success(currency))
            } catch let error {
                completion(.failure(error))
            }
        } .resume()
    }
}
