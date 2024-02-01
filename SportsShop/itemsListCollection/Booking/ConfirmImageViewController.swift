//
//  ConfirmImageViewController.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 01/02/24.
//

import UIKit
import Foundation

class ConfirmImageViewController: UIViewController {
    @IBOutlet weak var tickImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tickImageView.image = UIImage.gif(name: "bookingConfirm")
        
    }
    

    @IBAction func doneButtonAction(_ sender: Any) {
        
        let confirmPage = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "itemsCollectionViewController") as! itemsCollectionViewController
        navigationController?.pushViewController(confirmPage, animated: true)
    }
    

}
