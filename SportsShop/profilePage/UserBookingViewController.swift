//
//  UserBookingViewController.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 02/02/24.
//

import UIKit
import RealmSwift
class UserBookingViewController: UIViewController {
    @IBOutlet weak var bookingListTableView: UITableView!
    
    @IBOutlet weak var backGrndView: UIView!
    var userBookings: Results<BookingDetailsUsers>?
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if darkMode{
            view.overrideUserInterfaceStyle = .dark
            view.alpha = 0.8
        }else{
            view.overrideUserInterfaceStyle = .light
        }
        userBookings = realm.objects(BookingDetailsUsers.self).filter("userNameOfBooking == %@", storeUserName)

    }
    

    @IBAction func backBtnMain(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension UserBookingViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userBookings?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myBooking", for: indexPath) as! MyBookingTableViewCell

               // Configure the cell with data from the Realm object
               if let booking = userBookings?[indexPath.row] {
                  // cell.itemImageView.image = UIImage(named: booking. ?? "defaultImage")
                   cell.amountLabelOutlet.text = booking.amount
                   cell.countLabelOutlet.text = "\(booking.itemCount)"
                   cell.dateLabelOutlet.text = booking.bookingDate
                   
               }
        if darkMode{
            cell.backGrndView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
            cell.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.8)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    
}
