//
//  slideImageCollectionViewCell.swift
//  SportsShop
//
//  Created by apple on 15/01/24.
//

import UIKit

class slideImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageOutlet.layer.cornerRadius = 8
    }
}
