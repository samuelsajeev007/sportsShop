//
//  AdminHomeViewController.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 25/01/24.
//

import UIKit

class AdminHomeViewController: UIViewController {
    @IBOutlet weak var adminHomeCollectionView: UICollectionView!
    var adminOptions = ["Add items","Delete items","Bookings","sign out"]
    var optionImages = ["plus","min","shopping-cart","logoutAdmin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        setupBackgroundAnimations()
    }
    
    @IBAction func backButtonMain(_ sender: Any) {
        let backViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(backViewController, animated: true)
    }
    
}
extension AdminHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = adminHomeCollectionView.dequeueReusableCell(withReuseIdentifier: "adminCell", for: indexPath)as! AdminOpionCollectionViewCell
        cell.cellOptionLabel.text = adminOptions[indexPath.row]
        cell.iconImageview.image = UIImage(named: optionImages[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            let adminViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddItemViewController") as! AddItemViewController
            navigationController?.pushViewController(adminViewController, animated: true)
//        case 1:
//            let adminViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UpdateItemViewController") as! UpdateItemViewController
//            navigationController?.pushViewController(adminViewController, animated: true)
        case 1:
            let adminViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DeleteViewController") as! DeleteViewController
            navigationController?.pushViewController(adminViewController, animated: true)
        case 2:
            let adminViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminBookingListViewController") as! AdminBookingListViewController
            navigationController?.pushViewController(adminViewController, animated: true)
        case 3:
            let alertController = UIAlertController(title: NSLocalizedString("Log Out", comment: ""), message: NSLocalizedString("Are you Want to Log Out", comment: ""), preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            let okAction = UIAlertAction(title: "OK", style: .default){ _ in
                let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
                self.navigationController?.pushViewController(secondViewController, animated: true)
            }
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        default:
            print("default in admin option selection")
        }
    }
    
    
}
