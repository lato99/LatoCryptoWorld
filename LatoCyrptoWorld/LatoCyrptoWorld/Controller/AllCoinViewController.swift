//
//  AllCoinViewController.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 1.01.2023.
//

import UIKit

class AllCoinViewController: UIViewController {

    @IBOutlet weak var AllCoinTableView: UITableView!
    
    private var allCoinDataSource = AllCoinDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allCoinDataSource.delegate = self
        allCoinDataSource.getListOfCoin()
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


extension AllCoinViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCoinDataSource.getNumberOfCoin()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllCoinCell") as? AllCoinTableViewCell
        else  {
            return UITableViewCell()
        }
        if let coin = allCoinDataSource.getCoin(for: indexPath.row) {
            cell.idLabel.text = coin.id
            cell.nameLabel.text = coin.name
            cell.symbolLabel.text = coin.symbol
            cell.currencyLabel.text = "Click for current currency values."
        } else {
            cell.idLabel.text = "not found"
            cell.nameLabel.text = "not found"
            cell.symbolLabel.text = "not found"
            cell.currencyLabel.text = "not found"
        }
        return cell
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if
            let cell = sender as? UITableViewCell,
            let indexPath = AllCoinTableView.indexPath(for: cell),
            let coin = allCoinDataSource.getCoin(for: indexPath.row),
            let coinDetailController = segue.destination as? CyrptoListViewController
        {
            coinDetailController.coinId = coin.id
        }
        else{
            
        }
        
    }
    
    
    
}
    



extension AllCoinViewController : AllCoinDataDelegate {
  
    
    func allCoinListLoaded() {
        self.AllCoinTableView.reloadData()
    }
    
    
    
}

