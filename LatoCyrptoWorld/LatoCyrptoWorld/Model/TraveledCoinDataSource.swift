//
//  timeDataSource.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 10.01.2023.
//

import Foundation
class TraveledCoinDataSource{
    
    var delegate : TraveledCoinDataDelegate? // en son eklenen
    
    private var coinTraveled: Coin = Coin(id: "not returned", name: "null", symbol: "null",marketData: MarketData(currentPrice: CurrentPrice(usd: 1.0)))
    
    func getCoins(with id: String, time : String) {
        let session = URLSession.shared
        if let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(id)/history?date=\(time)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request){ data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    let str = String(decoding: data, as: UTF8.self)
                    
                    if str.contains("coin not found"){
                        self.coinTraveled = Coin(id: "\(id) does not exist", name: "wrong coin name", symbol: "wrong coin name",marketData: MarketData(currentPrice: CurrentPrice(usd: 0.0)))
                    }
                    else{
                        self.coinTraveled = try! decoder.decode(Coin.self, from: data)
                    }
                       }
                DispatchQueue.main.async {
                    self.delegate?.timeLoad()
                }
                }
         
            dataTask.resume()
            }
        
            

        }
    
    func getCoin()  -> Coin? {
        return coinTraveled
    }
    
    
}
