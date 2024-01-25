//
//  AdminHomeViewController.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 25/01/24.
//

import UIKit

class AdminHomeViewController: UIViewController {
    @IBOutlet weak var adminHomeCollectionView: UICollectionView!
    var adminOptions = ["Add items","Update items","Delete items","Bookings","sign out"]
    var optionImages = ["add-file","update","delete-account","add-to-cart","logOut"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
extension AdminHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = adminHomeCollectionView.dequeueReusableCell(withReuseIdentifier: "adminCell", for: indexPath)as! AdminOpionCollectionViewCell
        cell.cellOptionLabel.text = adminOptions[indexPath.row]
        cell.iconImageview.image = UIImage(named: optionImages[indexPath.row])
        return cell
    }
    
    
}
