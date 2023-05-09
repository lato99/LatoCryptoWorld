//
//  CoinRateTableViewCell.swift
//  LatoCyrptoWorld
//
//  Created by Lutfu on 14.01.2023.
//

import UIKit

class CoinRateTableViewCell: UITableViewCell {

    @IBOutlet weak var coinCurrency: UILabel!
    @IBOutlet weak var coinRate: UILabel!
    @IBOutlet weak var coinName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
