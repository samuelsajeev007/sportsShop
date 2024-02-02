//
//  ItemImageTableViewCell.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 31/01/24.
//

import UIKit

class ItemImageTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemImageView.layer.borderWidth = 1
        itemImageView.layer.borderColor = UIColor(red: 0/255, green: 128/255, blue: 223/255, alpha: 0.1).cgColor
        itemImageView.layer.masksToBounds = true
        itemImageView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
