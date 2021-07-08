//
//  CurrencyData.swift
//  Cryptonetics
//
//  Created by Alexander Kovzhut on 07.07.2021.
//

import Foundation

struct CurrencyData: Decodable {
    let assetID, name: String
        let typeIsCrypto: Int
        let dataSymbolsCount: Int
        let volume1HrsUsd, volume1DayUsd, volume1MthUsd, priceUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case name
        case typeIsCrypto = "type_is_crypto"
        case dataSymbolsCount = "data_symbols_count"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1DayUsd = "volume_1day_usd"
        case volume1MthUsd = "volume_1mth_usd"
        case priceUsd = "price_usd"
    }
}

