//
//  SearchCoinScreenViewController.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 1.01.2023.
//

import UIKit

class SearchCoinScreenViewController: UIViewController {

    @IBOutlet weak var searchLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
            
            if let coinDetailController = segue.destination as? CyrptoListViewController
         {
                coinDetailController.coinId = searchLabel.text
        }
        else{
            
        }
        
    }
    

}
