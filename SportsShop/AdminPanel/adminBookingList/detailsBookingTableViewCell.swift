//
//  detailsBookingTableViewCell.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 01/02/24.
//

import UIKit

class detailsBookingTableViewCell: UITableViewCell {
//    outlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var itemIdLabel: UILabel!
    @IBOutlet weak var bookingDate: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var dayTime: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    // image, view and button
    @IBOutlet weak var tickImageView: UIImageView!
    @IBOutlet weak var deliverdButtonOutlet: UIButton!
    @IBOutlet weak var backgroundViewBokking: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundViewBokking.layer.masksToBounds = true
        backgroundViewBokking.layer.cornerRadius = 13
        deliverdButtonOutlet.layer.cornerRadius = 13
        backgroundViewBokking.layer.borderWidth = 1
        backgroundViewBokking.layer.borderColor = UIColor(red: 0/255, green: 128/255, blue: 223/255, alpha: 0.7).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(with bookingDetails: BookingDetailsUsers) {
           userNameLabel.text = bookingDetails.userNameOfBooking
           itemIdLabel.text = bookingDetails.itemId
           bookingDate.text = bookingDetails.bookingDate
           address.text = bookingDetails.address
           count.text = "\(bookingDetails.itemCount)"
           phoneNumber.text = bookingDetails.UserPhNumber
           dayTime.text = bookingDetails.dayTime
        if let amountString = bookingDetails.amount, let amount = Double(amountString) {
                let totalAmount = Double(bookingDetails.itemCount) * amount
                self.amount.text = "\(totalAmount)"
            } else {
                self.amount.text = "Invalid"
            }
       }
    
}
