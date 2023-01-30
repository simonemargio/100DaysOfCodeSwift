//
//  CoinData.swift
//  ByteCoin
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation

struct CoinData: Codable {  // Codabole = Decodable AND Encodable
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}


/*
 
 "asset_id_base": "BTC",
 "asset_id_quote": "USD",
 "rate": 19776.25515594969
 
 */
