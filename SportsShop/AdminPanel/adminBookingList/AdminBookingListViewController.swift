//
//  AdminBookingListViewController.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 01/02/24.
//

import UIKit
import RealmSwift

class AdminBookingListViewController: UIViewController {
// outlets
    @IBOutlet weak var bookingTableView: UITableView!
    var bookingDetailsArray: Results<BookingDetailsUsers>?
    var tickCheckArray:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bookingTableView.register(UINib(nibName: "detailsBookingTableViewCell", bundle: nil), forCellReuseIdentifier: "detailsBookingTableViewCell")
        let realm = try! Realm()
        bookingDetailsArray = realm.objects(BookingDetailsUsers.self)
    }
    
    @IBAction func backMainButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension AdminBookingListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookingDetailsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bookingTableView.dequeueReusableCell(withIdentifier: "detailsBookingTableViewCell", for: indexPath)as! detailsBookingTableViewCell
        if tickCheckArray.contains(indexPath.row){
            cell.tickImageView.image = UIImage(named: "greenTick")
        }else{
            cell.tickImageView.image = UIImage(named: "redTick")
        }
        if let bookingDetails = bookingDetailsArray?[indexPath.row] {
                    cell.configureCell(with: bookingDetails)
                }
        
        cell.deliverdButtonOutlet.tag = indexPath.row
        cell.deliverdButtonOutlet.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return cell
    }
    
    @objc func buttonAction(sender : UIButton){
        print(sender.tag)
                if tickCheckArray.contains(sender.tag){
                
                    tickCheckArray.removeAll(where: { $0 == sender.tag})
                
                }else{
                
                    tickCheckArray.append(sender.tag)
                    print("the",sender.tag)
                    print(tickCheckArray)
                    }
                print(tickCheckArray)
        bookingTableView.reloadData()

    }
    
}
