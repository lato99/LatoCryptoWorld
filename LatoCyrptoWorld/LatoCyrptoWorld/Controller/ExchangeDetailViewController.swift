//
//  ExchangeDetailViewController.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 14.01.2023.
//

import UIKit

class ExchangeDetailViewController: UIViewController {
   
    
    @IBOutlet weak var ExchangeTableView: UITableView!
    
    var coin1 : String?
    var coin2 : String?
    
    private var coinDataSource = CurrencyDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinDataSource.delegate = self
        if let coinId = coin1 {
            coinDataSource.getFirstCoin(with: coinId)
        }
        if let coinId2 = coin2 {
            coinDataSource.getSecondCoin(with: coinId2)
        }
        }
        
          
            
            
            // Do any additional setup after loading the view.
            
            
            
            /*
             // MARK: - Navigation
             
             // In a storyboard-based application, you will often want to do a little preparation before navigation
             override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             // Get the new view controller using segue.destination.
             // Pass the selected object to the new view controller.
             }
             */
            
        }
    

extension ExchangeDetailViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinDataSource.getNumberOfCoin()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell") as? CoinRateTableViewCell
        else  {
            
            return UITableViewCell()
        }
        if let coin1 = coinDataSource.getCoin1(),
           let coin2 = coinDataSource.getCoin2(){
            if let price1 = coin1.marketData?.currentPrice?.usd,
               let price2 = coin2.marketData?.currentPrice?.usd{
                cell.coinName.text = coin1.name
                cell.coinRate.text = String(price1/price2)
                cell.coinCurrency.text = coin2.symbol   
            }
            }
 
        else {
            cell.coinName.text = "Check the coin names"
            cell.coinRate.text = "Check the coin names"
            cell.coinCurrency.text = "Check the coin names"
        }
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if
//            let cell = sender as? UITableViewCell,
//            let indexPath = cityTableView.indexPath(for: cell),
//            let city = citiesDataSource.getCity(for: indexPath.row),
//            let cityDetailController = segue.destination as? RegionListViewController
//        {
//            cityDetailController.cityId = city.Id
//        }
//
//
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
    

    
    
}


extension ExchangeDetailViewController : CurrencyDataDelegate {
    
    
    func coinListLoaded() {
        self.ExchangeTableView.reloadData()
    }
    
    
}
