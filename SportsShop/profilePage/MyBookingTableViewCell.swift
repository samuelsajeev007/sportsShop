//
//  MyBookingTableViewCell.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 02/02/24.
//

import UIKit

class MyBookingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var amountLabelOutlet: UILabel!
    @IBOutlet weak var countLabelOutlet: UILabel!
    @IBOutlet weak var dateLabelOutlet: UILabel!
    @IBOutlet weak var backGrndView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backGrndView.layer.borderWidth = 1
        backGrndView.layer.borderColor = UIColor(red: 0/255, green: 128/255, blue: 223/255, alpha: 0.3).cgColor
        backGrndView.layer.masksToBounds = true
        backGrndView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
