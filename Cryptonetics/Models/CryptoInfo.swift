//
//  CurrencyData.swift
//  Cryptonetics
//
//  Created by Alexander Kovzhut on 07.07.2021.
//

import Foundation

struct CryptoInfo: Codable {
    let name: String?
    let price_usd: Float?
    let asset_id: String
    let id_icon: String?
}

