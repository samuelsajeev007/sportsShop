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
    @IBOutlet weak var backGroundView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backGroundView.layer.borderWidth = 1
        backGroundView.layer.borderColor = UIColor(red: 0/255, green: 128/255, blue: 223/255, alpha: 0.3).cgColor
        backGroundView.layer.masksToBounds = true
        backGroundView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
