//
//  AdminOpionCollectionViewCell.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 25/01/24.
//

import UIKit

class AdminOpionCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var cellBackgroundView: UIView!
    
    @IBOutlet weak var cellOptionLabel: UILabel!
    
    @IBOutlet weak var iconImageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        //cellBackgroundView.applyGradient()
    }
    
}
extension UIView
{
    func applyGradient()
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 128/255, green: 217/255, blue: 88/255, alpha: 1).cgColor,UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor]
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0,y:0)
        gradientLayer.endPoint = CGPoint(x:1,y:0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    func ThreeColorGradient()
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 255/255, green: 251/255, blue: 232/255, alpha: 1).cgColor,UIColor(red: 255/255, green: 253/255, blue: 240/255, alpha: 1).cgColor,UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor]
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0,y:0)
        gradientLayer.endPoint = CGPoint(x:1,y:0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

