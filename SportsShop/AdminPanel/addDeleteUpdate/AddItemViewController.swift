//
//  AddItemViewController.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 25/01/24.
//

import UIKit
import RealmSwift

class AddItemViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var addLabelOutlet: UILabel!
    
    @IBOutlet weak var labelItemNoListOutlet: UILabel!
    @IBOutlet weak var itemImages: UIImageView!
    @IBOutlet weak var quantityTxtFld: UITextField! //actually it is id no
    @IBOutlet weak var amountTxtFld: UITextField! // amount
    @IBOutlet weak var itemSubmitButton: UIButton!
    @IBOutlet weak var itemIdTxtFld: UITextField! // item no
    
    @IBOutlet weak var itemTxtFld: UITextField!
    @IBOutlet weak var itemNameTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        itemIdTxtFld.delegate = self
        itemSubmitButton.layer.cornerRadius = 12
        itemSubmitButton.layer.borderWidth = 2
        itemSubmitButton.layer.borderColor = UIColor(red: 0/255, green: 128/255, blue: 223/255, alpha: 0.7).cgColor
//        setupBackgroundAnimations()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
           if textField == itemIdTxtFld {
               labelItemNoListOutlet.isHidden = true
           } else {
               labelItemNoListOutlet.isHidden = false
           }
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
        if let quantityText = quantityTxtFld.text,
           let amountText = amountTxtFld.text,
           let itemIdText = itemIdTxtFld.text,
           let itemId = Int(itemIdText),
           !quantityText.isEmpty,
           !amountText.isEmpty,
           !itemIdText.isEmpty,
           [0, 1, 2, 3].contains(itemId),
           itemImages.image != nil {
            saveItemToRealm()
            addLabelOutlet.isHidden = false
        }
        let alertController = UIAlertController(title: NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("Fill all items", comment: ""), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
//        let backViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminHomeViewController") as! AdminHomeViewController
//        navigationController?.pushViewController(backViewController, animated: true)
        
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
    

