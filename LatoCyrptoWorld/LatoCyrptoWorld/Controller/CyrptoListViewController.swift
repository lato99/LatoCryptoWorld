//
//  CyrptoListViewController.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 1.01.2023.
//

import UIKit

class CyrptoListViewController: UIViewController {
    @IBOutlet weak var cyrptoTableView: UITableView!
    
    
    private var coinDataSource = CoinDataSource()

    var coinId : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinDataSource.delegate = self
        if let coinId = coinId {
            coinDataSource.getListOfCoin(with: coinId)
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension CyrptoListViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinDataSource.getNumberOfCoin()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell") as? CyrptoTableViewCell
        else  {
            return UITableViewCell()
        }
        if let coin = coinDataSource.getCoin(for: indexPath.row) {
            
            
            cell.idLabel.text = coin.id
            cell.nameLabel.text = coin.name
            cell.symbolLabel.text = coin.symbol
            
            if let x = coin.marketData?.currentPrice?.usd{
                cell.currencyLabel.text = String(x)
            }
            else{cell.currencyLabel.text = "no val returned"
                cell.idLabel.text = "Please provide valid coinID"
                cell.nameLabel.text = "Please provide valid coinID"
                cell.symbolLabel.text = "Please provide valid coinID"
            }
            //cell.currencyLabel.text = String(coin.marketData.currentPrice.usd)
          
            }
        else {
            cell.idLabel.text = "not found"
            cell.nameLabel.text = "not found"
            cell.symbolLabel.text = "not found"
            cell.currencyLabel.text = "not found"
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


extension CyrptoListViewController : CoinDataDelegate {
  
    
    func coinListLoaded() {
        self.cyrptoTableView.reloadData()
    }
    
    
    
}
