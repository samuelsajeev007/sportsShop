//
//  BookingTableViewCell.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 31/01/24.
//

import UIKit

class BookingTableViewCell: UITableViewCell {
    // outlets
    @IBOutlet weak var userNameLabelOutlet: UILabel!
    @IBOutlet weak var countLabelOutlet: UILabel!
    @IBOutlet weak var phoneNumberTxtFld: UITextField!
    @IBOutlet weak var addressTxtView: UITextView!
    @IBOutlet weak var morningBtnOutlet: UIButton!
    @IBOutlet weak var afterNoonBtnoutlet: UIButton!
    @IBOutlet weak var confirmBtnOutlet: UIButton!
    @IBOutlet weak var minusBtnOutlet: UIButton!
    @IBOutlet weak var plusBtnOutlet: UIButton!
    // variables
    //var count = ["1","2","3","4","5"]
    var itemCount = 1

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userNameLabelOutlet.text = storeUserName
        minusBtnOutlet.layer.cornerRadius = 0.5 * minusBtnOutlet.bounds.size.width
        plusBtnOutlet.layer.cornerRadius = 0.5 * plusBtnOutlet.bounds.size.width
        morningBtnOutlet.layer.borderWidth = 2
        afterNoonBtnoutlet.layer.borderWidth = 2
        morningBtnOutlet.layer.borderColor = UIColor(red: 26, green: 100, blue: 45, alpha: 1).cgColor
        afterNoonBtnoutlet.layer.borderColor = UIColor(red: 255, green: 59, blue: 48, alpha: 1).cgColor
        morningBtnOutlet.layer.cornerRadius = 12
        afterNoonBtnoutlet.layer.cornerRadius = 12
        confirmBtnOutlet.layer.cornerRadius = 15
        countLabelOutlet.text = "1"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func minusBtnAction(_ sender: Any) {
        if itemCount != 1{
            itemCount = itemCount - 1
            countLabelOutlet.text = String(itemCount)
        }
    }
    
    @IBAction func addBtnAction(_ sender: Any) {
        if itemCount != 5{
            itemCount = itemCount + 1
            countLabelOutlet.text = String(itemCount)
        }
    }
    
    @IBAction func morningBtnAction(_ sender: Any) {
    }
    
    @IBAction func afternoonBtnAction(_ sender: Any) {
    }
    
    @IBAction func confirmBtnAction(_ sender: Any) {
        print(itemCount)
    }
    
    
}
