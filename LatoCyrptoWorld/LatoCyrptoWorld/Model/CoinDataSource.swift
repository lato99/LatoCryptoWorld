//
//  CoinDataSource.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 1.01.2023.
//

import Foundation

class CoinDataSource {
    

   
    private let baseURL = "https://api.coingecko.com/api/v3/coins/"

    private var coinArray: Coin = Coin(id: "null", name: "null", symbol: "null",marketData: MarketData(currentPrice: CurrentPrice(usd: 1.0)))
    var delegate : CoinDataDelegate?
    
    func getListOfCoin(with id: String) {
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
                        self.coinArray = Coin(id: "\(id) does not exist", name: "wrong coin name", symbol: "wrong coin name",marketData: MarketData(currentPrice: CurrentPrice(usd: 0.0)))
                    }
                    else{
                        self.coinArray = try! decoder.decode(Coin.self, from: data)
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
    
    
    
        func getCoin(for index:Int) -> Coin? {
            coinArray
        }

    
    
    //create the URL

        
        
    }

