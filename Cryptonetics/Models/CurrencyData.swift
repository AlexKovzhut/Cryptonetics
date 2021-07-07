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
        let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: String
        let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: String
        let dataSymbolsCount: Int
        let volume1HrsUsd, volume1DayUsd, volume1MthUsd, priceUsd: Double

        enum CodingKeys: String, CodingKey {
            case assetID = "asset_id"
            case name
            case typeIsCrypto = "type_is_crypto"
            case dataStart = "data_start"
            case dataEnd = "data_end"
            case dataQuoteStart = "data_quote_start"
            case dataQuoteEnd = "data_quote_end"
            case dataOrderbookStart = "data_orderbook_start"
            case dataOrderbookEnd = "data_orderbook_end"
            case dataTradeStart = "data_trade_start"
            case dataTradeEnd = "data_trade_end"
            case dataSymbolsCount = "data_symbols_count"
            case volume1HrsUsd = "volume_1hrs_usd"
            case volume1DayUsd = "volume_1day_usd"
            case volume1MthUsd = "volume_1mth_usd"
            case priceUsd = "price_usd"
        }
}
