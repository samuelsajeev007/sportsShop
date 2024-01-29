//
//  itemsCollectionViewController.swift
//  SportsShop
//
//  Created by apple on 15/01/24.
//

import UIKit
import RealmSwift

class itemsCollectionViewController: UIViewController {

    @IBOutlet weak var itemCollections: UICollectionView!
    var items: Results<Item>?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemCollections.register(UINib(nibName: "ItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemsCollectionViewCell")
        fetchItems()
    }
    func fetchItems() {
            do {
                let realm = try Realm()
                // Fetch all items from the Item class
                items = realm.objects(Item.self)
                itemCollections.reloadData()
            } catch {
                print("Error fetching items: \(error)")
            }
        }
    
}
extension itemsCollectionViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemCollections.dequeueReusableCell(withReuseIdentifier: "ItemsCollectionViewCell", for: indexPath)as! ItemsCollectionViewCell
        if let item = items?[indexPath.item] {
                    cell.configure(with: item)
                }
        return cell
    }
    
    
}
