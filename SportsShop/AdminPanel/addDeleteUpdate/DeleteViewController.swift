//
//  DeleteViewController.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 29/01/24.
//

import UIKit
import RealmSwift

class DeleteViewController: UIViewController {

    @IBOutlet weak var deleteBtnOutlet: UIButton!
    @IBOutlet weak var nameTxtFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        deleteBtnOutlet.layer.borderWidth = 2
        deleteBtnOutlet.layer.borderColor = UIColor.red.cgColor
        deleteBtnOutlet.layer.cornerRadius = 12
    }
    
    @IBAction func backButtonMain(_ sender: Any) {
        let backViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminHomeViewController") as! AdminHomeViewController
        navigationController?.pushViewController(backViewController, animated: true)
    }
    
    @IBAction func deleteBtnAction(_ sender: Any) {
        deleteItemFromRealm()
        
    }
    


    func deleteItemFromRealm() {
           guard let quantityString = nameTxtFld.text, let quantity = Int(quantityString) else {
               // Handle the case when the text field is empty or doesn't contain a valid quantity
               return
           }

           do {
               let realm = try Realm()
               
               // Fetch the item with the specified quantity from Realm
               let itemsToDelete = realm.objects(NewItem.self).filter("quantity == %@", quantity)

               if !itemsToDelete.isEmpty {
                   try realm.write {
                       // Delete the items from Realm
                       realm.delete(itemsToDelete)
                       print("Items with quantity \(quantity) deleted successfully")
                       let alertController = UIAlertController(title: NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("deleted successfully", comment: ""), preferredStyle: .alert)
                       let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                       alertController.addAction(okAction)
                       present(alertController, animated: true, completion: nil)
                      
                   }
               } else {
                   print("No items found with quantity \(quantity)")
               }
           } catch {
               print("Error deleting items from Realm: \(error)")
           }
        
       }
   }
