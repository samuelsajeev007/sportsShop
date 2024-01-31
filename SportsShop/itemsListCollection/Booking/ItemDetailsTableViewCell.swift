//
//  ItemDetailsTableViewCell.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 31/01/24.
//

import UIKit

class ItemDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var itemIdLabelOutlet: UILabel!
    @IBOutlet weak var amountLabelOutlet: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
