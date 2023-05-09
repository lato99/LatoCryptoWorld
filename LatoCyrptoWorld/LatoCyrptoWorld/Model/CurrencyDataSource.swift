//
//  CurrencyDataSource.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 14.01.2023.
//

import Foundation
//
//  CoinDataSource.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 1.01.2023.
//

import Foundation

class CurrencyDataSource {
    
    var delegate : CurrencyDataDelegate? // en son eklenen

   
    private let baseURL = "https://api.coingecko.com/api/v3/coins/"

    private var Coin1: Coin = Coin(id: "null", name: "null", symbol: "null",marketData: MarketData(currentPrice: CurrentPrice(usd: 1.0)))
    
    private var Coin2: Coin = Coin(id: "null", name: "null", symbol: "null",marketData: MarketData(currentPrice: CurrentPrice(usd: 1.0)))
    
    
    
    
    func getFirstCoin(with id: String) {
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)\(id)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request){ data, response, error in
                if let data = data {
                    let str = String(decoding: data, as: UTF8.self) //see what it returns, if error occured.
                    let decoder = JSONDecoder()
                    
                    
                    if str.contains("coin not found"){
                        self.Coin1 = Coin(id: "\(id) does not exist", name: "wrong coin name", symbol: "wrong coin name",marketData: MarketData(currentPrice: CurrentPrice(usd: 0.0)))
                    }
                    else{
                        self.Coin1 = try! decoder.decode(Coin.self, from: data)
                    }
                    
                    
                    
                    
                    
                    
                }
                DispatchQueue.main.async {
                    self.delegate?.coinListLoaded()
                }
                }
         
            dataTask.resume()
            }
        
            
        

        
        
        
        
        
        
        

        }
    func getSecondCoin(with id: String) {
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)\(id)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request){ data, response, error in
                if let data = data {
                    let str = String(decoding: data, as: UTF8.self) //see what it returns, if error occured.
                    let decoder = JSONDecoder()
                    
                    
                    if str.contains("coin not found"){
                        self.Coin2 = Coin(id: "\(id) does not exist", name: "wrong coin name", symbol: "wrong coin name",marketData: MarketData(currentPrice: CurrentPrice(usd: 0.0)))
                    }
                    else{
                        self.Coin2 = try! decoder.decode(Coin.self, from: data)
                    }
                    
                    
                    
                    
                    
                    
                }
                DispatchQueue.main.async {
                    self.delegate?.coinListLoaded()
                }
                }
         
            dataTask.resume()
            }
        
            
        

        
        
        
        
        
        
        

        }
    
    
    
    func getNumberOfCoin() -> Int {
        return 1
    }
    
    
    
        func getCoin1() -> Coin? {
            return Coin1
        }
    
    func getCoin2() -> Coin? {
        return Coin2
    }

    
    
    //create the URL

        
        
    }

