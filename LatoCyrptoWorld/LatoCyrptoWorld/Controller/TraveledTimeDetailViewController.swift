//
//  time22ViewController.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 10.01.2023.
//

import UIKit

class TraveledTimeDetailViewController: UIViewController {

    @IBOutlet weak var coinsTable: UITableView!
    var coinId : String?
    var coinDate : String?
    
    private var coinDataSource = TraveledCoinDataSource()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinDataSource.delegate = self
        if let coinId = coinId,
            let coinDate = coinDate{
            print("done")
            coinDataSource.getCoins(with: coinId, time: coinDate)
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


extension TraveledTimeDetailViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell") as? TraveledTimeTableViewCell
        else  {
            return UITableViewCell()
        }
        if let coin = coinDataSource.getCoin() {
            if let x = coin.marketData?.currentPrice?.usd{
                cell.currencyLabel.text = String(x)
                cell.nameLabel.text = coin.name
                cell.symbolLabel.text = coin.symbol
                cell.idLabel.text = coin.id
            }
            else{
                cell.currencyLabel.text = "no currency returned"
                cell.nameLabel.text = "Enter another value"
                cell.symbolLabel.text = "Enter another value"
                cell.idLabel.text = "Enter another value"
            }
            
            //cell.currencyLabel.text = String(coin.marketData.currentPrice.usd)
            
        }
        return cell
    }
    
    
    

}



extension TraveledTimeDetailViewController : TraveledCoinDataDelegate {
  
    func timeLoad() {
        self.coinsTable.reloadData()
    }
    
    
    
}

