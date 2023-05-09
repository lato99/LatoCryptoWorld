//
//  ExchangeScreenViewController.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 14.01.2023.
//

import UIKit

class ExchangeScreenViewController: UIViewController {

    @IBOutlet weak var coin2Label: UITextField!
    @IBOutlet weak var coin1Label: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        if let coinDetailController = segue.destination as? ExchangeDetailViewController
     {
            coinDetailController.coin1 = coin1Label.text
            coinDetailController.coin2 = coin2Label.text
            
            //coinDetailController.coinId = coinNameLabel.text
            //coinDetailController.coinDate = formatter.string(from: datePicker.date)
           // print(formatter.string(from: datePicker.date))
    }
    else{
        
    }
    }
    
    

}
