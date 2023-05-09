//
//  Real_price.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 7.01.2023.
//

import Foundation

// MARK: - MarketData
struct MarketData: Codable {
    let currentPrice: CurrentPrice?

    enum CodingKeys: String, CodingKey {
        case currentPrice = "current_price"
    }
}
