//
//  NetworkManager.swift
//  Cryptonetics
//
//  Created by Alexander Kovzhut on 07.07.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    public var icons: [CryptoIcons] = []
    
    private var whenReadyBlock: ((Result<[CryptoInfo], Error>) -> Void)?
    
    public func getAllCryptoData(completion: @escaping (Result<[CryptoInfo], Error>) -> Void) {
        guard !icons.isEmpty else {
            whenReadyBlock = completion
            return
        }
        
        guard let url = URL(string: "\(Constants.assetsEndpointInfo)\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let cryptos = try JSONDecoder().decode([CryptoInfo].self, from: data)
                
                completion(.success(cryptos))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    public func getAlIcons() {
        guard let url = URL(string: "\(Constants.assetsEndpointIcons)\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                self?.icons = try JSONDecoder().decode([CryptoIcons].self, from: data)
                if let completion = self?.whenReadyBlock {
                self?.getAllCryptoData(completion: completion)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
