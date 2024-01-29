//
//  ItemsCollectionViewCell.swift
//  SportsShop
//
//  Created by apple on 15/01/24.
//

import UIKit
import RealmSwift

class ItemsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var iteamRate: UILabel!
    @IBOutlet weak var itemImages: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with item: Item) {
            itemCount.text = "\(item.quantity)"
            iteamRate.text = "\(item.amount)"
            
            if let imageData = item.image {
                itemImages.image = UIImage(data: imageData)
            } else {
                // Set a default image or handle the case when there is no image
                itemImages.image = UIImage(named: "defaultImage")
            }
        }

}
