//
//  BookingTableViewCell.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 31/01/24.
//

import UIKit
import RealmSwift

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
    @IBOutlet weak var successView: UIView!
    @IBOutlet weak var successBtnOutlet: UIButton!
    @IBOutlet weak var successViewBottamConstraint: NSLayoutConstraint!
    @IBOutlet weak var successBtnBottamOutlet: NSLayoutConstraint!
    
    
    // variables
    //var count = ["1","2","3","4","5"]
    var itemCount = 1
    var dayTimeIs = "Morning"
    var currentDate = String()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        currentDate = dateFormatter.string(from: Date())
        // Initialization code
        userNameLabelOutlet.text = storeUserName
        minusBtnOutlet.layer.cornerRadius = 0.5 * minusBtnOutlet.bounds.size.width
        plusBtnOutlet.layer.cornerRadius = 0.5 * plusBtnOutlet.bounds.size.width
        morningBtnOutlet.layer.borderWidth = 2
        afterNoonBtnoutlet.layer.borderWidth = 2
        morningBtnOutlet.layer.borderColor = UIColor.green.cgColor
        afterNoonBtnoutlet.layer.borderColor = UIColor.red.cgColor
        morningBtnOutlet.layer.cornerRadius = 12
        afterNoonBtnoutlet.layer.cornerRadius = 12
        confirmBtnOutlet.layer.cornerRadius = 15
        countLabelOutlet.text = "1"
       // successView.layer.cornerRadius = 0.5 * successView.bounds.size.width
        //successBtnOutlet.layer.cornerRadius = 0.5 * successBtnOutlet.bounds.size.width
        //successView.isHidden = true
        //successBtnOutlet.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func successBtnAction(_ sender: Any) {
       
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
        dayTimeIs = "Morning"
        morningBtnOutlet.layer.backgroundColor = UIColor(red: 0/255, green: 146/255, blue: 0/255, alpha: 0.5).cgColor
        afterNoonBtnoutlet.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
    }
    
    @IBAction func afternoonBtnAction(_ sender: Any) {
        dayTimeIs = "Afternoon"
        afterNoonBtnoutlet.layer.backgroundColor = UIColor(red: 146/255, green: 0/255, blue: 0/255, alpha: 0.5).cgColor
        morningBtnOutlet.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
    }
    
    @IBAction func confirmBtnAction(_ sender: Any) {
        print(itemCount)
        print(dayTimeIs)
        print(currentDate)
        print(amounts,"the amount")
        print(itemIdBokking,"item id is")
        let bookingDetails = BookingDetailsUsers()

         
           bookingDetails.userNameOfBooking = userNameLabelOutlet.text
           bookingDetails.bookingDate = currentDate
           bookingDetails.dayTime = dayTimeIs
           bookingDetails.address = addressTxtView.text
           bookingDetails.UserPhNumber = phoneNumberTxtFld.text
           bookingDetails.itemId = itemIdBokking
           bookingDetails.itemCount = itemCount
           bookingDetails.amount = amounts
           
           do {
               let realm = try Realm()
               try realm.write {
                   realm.add(bookingDetails)
                   
               }
               print("Data saved to Realm")
           } catch {
               print("Error saving data to Realm: \(error)")
           }
        
        
       }
}
    
    

