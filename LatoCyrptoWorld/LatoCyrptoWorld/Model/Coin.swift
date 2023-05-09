//
//  Coin.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 1.01.2023.
//

import Foundation

struct Coin: Codable {
    let id : String
    let name : String
    let symbol : String
    //let id, name, symbol: String
    let marketData: MarketData?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name
        case marketData = "market_data"
   }
}

//struct Coin : Decodable{
//    let id : String
//    let name : String
//    let symbol : String
//    let market_data : [Description]
//
//}
