//
//  CoinTableViewCell.swift
//  Cryptonetics
//
//  Created by Alexander Kovzhut on 07.07.2021.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    
    static let identifier = "CurrencyCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
