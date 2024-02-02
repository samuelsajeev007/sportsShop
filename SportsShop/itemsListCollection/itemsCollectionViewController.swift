//
//  itemsCollectionViewController.swift
//  SportsShop
//
//  Created by apple on 15/01/24.
//

import UIKit
import RealmSwift
var cellSelected = Int()// which cell is selected

class itemsCollectionViewController: UIViewController {

    @IBOutlet weak var itemCollections: UICollectionView!
    var items: Results<NewItem>?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        itemCollections.register(UINib(nibName: "ItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemsCollectionViewCell")
        fetchItems()
    }
    func fetchItems() {
           do {
               let realm = try Realm()
               
               // Use parameterized query instead of string interpolation
               let predicate = NSPredicate(format: "id == %d", buttonVlaue)
               items = realm.objects(NewItem.self).filter(predicate).sorted(byKeyPath: "quantity")
               
               // Reload collection view inside the completion block
               itemCollections.reloadData()
           } catch {
               print("Error fetching items: \(error)")
           }
       }
    
    @IBAction func backButtonMain(_ sender: Any) {
        let backViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(backViewController, animated: true)
    }
}
extension itemsCollectionViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemCollections.dequeueReusableCell(withReuseIdentifier: "ItemsCollectionViewCell", for: indexPath)as! ItemsCollectionViewCell
        //cell.backGroundView.cellGradient()
        cell.itemName.isHidden = true
        if let item = items?[indexPath.item] {
                    cell.configure(with: item)
                }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let selectedItem = items?[indexPath.item] {
              
               let selectedQuantity = selectedItem.quantity
               let BookingViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BookingViewController") as! BookingViewController

               // Pass the selected item and quantity to the ShowViewController
            BookingViewController.selectedItem = selectedItem
            BookingViewController.selectedQuantity = selectedQuantity

               // Push the ShowViewController onto the navigation stack
               navigationController?.pushViewController(BookingViewController, animated: true)
           }
    }
    
    
}

extension UIView
{
    func cellGradient()
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2).cgColor,UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 0.4).cgColor]
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0,y:0)
        gradientLayer.endPoint = CGPoint(x:1,y:0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
