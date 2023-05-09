//
//  AllCoinDataSource.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 1.01.2023.
//


import Foundation

class AllCoinDataSource {
    

   
    private let baseURL = "https://api.coingecko.com/api/v3/coins/list"

    private var coinArray: [Coin] = []
    
    var delegate : AllCoinDataDelegate?
    
    func getListOfCoin() {
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request){ data, response, error in
                if let data = data {

                    let decoder = JSONDecoder()
                    self.coinArray = try! decoder.decode([Coin].self, from: data)
                }
                DispatchQueue.main.async {
                    self.delegate?.allCoinListLoaded()
                }
                }
         
            dataTask.resume()
            }
        
            

        }
    
    
    
    
    func getNumberOfCoin() -> Int {
        return coinArray.count
    }
    
    
    
        func getCoin(for index:Int) -> Coin? {
            guard index < coinArray.count else {
                return nil
            }
            return coinArray[index]
        }
    //create the URL

        
        
    }

