//
//  AddItemViewController.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 25/01/24.
//

import UIKit
import RealmSwift

class AddItemViewController: UIViewController {
    @IBOutlet weak var addLabelOutlet: UILabel!
    
    @IBOutlet weak var itemImages: UIImageView!
    @IBOutlet weak var quantityTxtFld: UITextField!
    @IBOutlet weak var amountTxtFld: UITextField!
    @IBOutlet weak var itemSubmitButton: UIButton!
    @IBOutlet weak var itemIdTxtFld: UITextField!
    
    @IBOutlet weak var itemTxtFld: UITextField!
    @IBOutlet weak var itemNameTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        itemSubmitButton.layer.cornerRadius = 12
        setupBackgroundAnimations()
    }
    
    @IBAction func backButtonMain(_ sender: Any) {
        let backViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminHomeViewController") as! AdminHomeViewController
        navigationController?.pushViewController(backViewController, animated: true)
    }
    
    @IBAction func imageSelectButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.modalPresentationStyle = .fullScreen
                present(imagePicker, animated: true, completion: nil)
        addLabelOutlet.isHidden = true
        
    }
    
    @IBAction func itemSubmitAction(_ sender: Any) {
        saveItemToRealm()
        addLabelOutlet.isHidden = false
        let backViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminHomeViewController") as! AdminHomeViewController
        navigationController?.pushViewController(backViewController, animated: true)
        
    }
    
    func saveItemToRealm() {
           let newItem = NewItem()
           newItem.image = itemImages.image?.jpegData(compressionQuality: 1.0)
           newItem.quantity = Int(quantityTxtFld.text ?? "") ?? 0
           newItem.amount = Double(amountTxtFld.text ?? "") ?? 0.0
           newItem.id = Int(itemIdTxtFld.text ?? "") ?? 0
        
           do {
               let realm = try Realm()
               try realm.write {
                   realm.add(newItem)
               }
               print("Item added to Realm successfully")
               let alertController = UIAlertController(title: NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("Item added  successfully", comment: ""), preferredStyle: .alert)
               let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               alertController.addAction(okAction)
               present(alertController, animated: true, completion: nil)
           } catch {
               print("Error saving item to Realm: \(error)")
           }
       }
   }

   extension AddItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
           if let selectedImage = info[.originalImage] as? UIImage {
               itemImages.image = selectedImage
               // Save item to Realm when an image is selected
               //saveItemToRealm()
           }
           picker.dismiss(animated: true, completion: nil)
       }
   }
    

