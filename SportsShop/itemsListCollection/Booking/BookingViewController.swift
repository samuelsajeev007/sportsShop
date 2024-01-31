//
//  BookingViewController.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 31/01/24.
//

import UIKit

class BookingViewController: UIViewController {
        var selectedItem: NewItem?
        var selectedQuantity: Int?
//    outlets
    
    @IBOutlet weak var IdNoLabelOutlet: UILabel!
    @IBOutlet weak var bookingTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bookingTableView.register(UINib(nibName: "ItemImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemImageTableViewCell")
        bookingTableView.register(UINib(nibName: "BookingTableViewCell", bundle: nil), forCellReuseIdentifier: "BookingTableViewCell")
        bookingTableView.register(UINib(nibName: "ItemDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemDetailsTableViewCell")
//        if let item = selectedItem, let quantity = selectedQuantity {
//            
//            // Use item and quantity to update your UI
//            // Example: titleLabel.text = "Item: \(item.name), Quantity: \(quantity)"
//            //IdNoLabelOutlet.text = "\(item.quantity)"
//        }
    }
    
    @IBAction func backBtnMain(_ sender: Any) {
       
                        self.navigationController?.popViewController(animated: true)

    }
    
 }

extension BookingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = bookingTableView.dequeueReusableCell(withIdentifier: "ItemImageTableViewCell", for: indexPath) as! ItemImageTableViewCell
            if let item = selectedItem, let quantity = selectedQuantity {
                
                cell.itemImageView.image = UIImage(data: item.image!)

            }

            return cell
        case 1:
            let cell = bookingTableView.dequeueReusableCell(withIdentifier: "ItemDetailsTableViewCell", for: indexPath) as! ItemDetailsTableViewCell
            if let item = selectedItem, let quantity = selectedQuantity {
                cell.amountLabelOutlet.text = String(item.amount)
                cell.itemIdLabelOutlet.text = String(item.quantity)
            }
            return cell
        case 2:
            let cell = bookingTableView.dequeueReusableCell(withIdentifier: "BookingTableViewCell", for: indexPath) as! BookingTableViewCell
            return cell
        default:
            print("hello")
        }
        return UITableViewCell()
    }
    
    
}
