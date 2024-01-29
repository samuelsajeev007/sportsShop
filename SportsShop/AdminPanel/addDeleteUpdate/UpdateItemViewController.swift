//
//  UpdateItemViewController.swift
//  SportsShop
//
//  Created by Samuel Sajeev on 29/01/24.
//

import UIKit
import RealmSwift

class UpdateItemViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var updateValues: Results<Item>?
    @IBOutlet weak var itemId: UITextField!
    @IBOutlet weak var newAmountTxtFld: UITextField!
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var updateBtnOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addImageBtn(_ sender: Any) {
        pickImage()
    }
    
    @IBAction func updateButtonAction(_ sender: Any) {
        updateItemInRealm()
    }
   
    func pickImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            newImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func updateItemInRealm() {
        guard let itemIdText = itemId.text,
              let newAmountText = newAmountTxtFld.text,
              let newAmount = Double(newAmountText) else {
            // Handle invalid input
            return
        }
        do {
                    let realm = try Realm()
                    
                    // Fetch items with amount equal to 1
                    updateValues = realm.objects(Item.self).filter("quantity == \(itemIdText)")
            
                    
                    
                
            } catch {
                print("Error fetching items: \(error)")
            }

    }
    
}
