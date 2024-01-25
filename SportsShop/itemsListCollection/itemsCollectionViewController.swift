//
//  itemsCollectionViewController.swift
//  SportsShop
//
//  Created by apple on 15/01/24.
//

import UIKit

class itemsCollectionViewController: UIViewController {

    @IBOutlet weak var itemCollections: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemCollections.register(UINib(nibName: "ItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemsCollectionViewCell")
    }
    
}
extension itemsCollectionViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemCollections.dequeueReusableCell(withReuseIdentifier: "ItemsCollectionViewCell", for: indexPath)as! ItemsCollectionViewCell
        return cell
    }
    
    
}
