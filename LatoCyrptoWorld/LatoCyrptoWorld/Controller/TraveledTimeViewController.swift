//
//  timeViewController.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 10.01.2023.
//

import UIKit

class TraveledTimeViewController: UIViewController {

    @IBOutlet weak var coinNameLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
        if let coinDetailController = segue.destination as? TraveledTimeDetailViewController
     {
            coinDetailController.coinId = coinNameLabel.text
            coinDetailController.coinDate = formatter.string(from: datePicker.date)
            print(formatter.string(from: datePicker.date))
    }
    else{
        
    }
    }
    

}
