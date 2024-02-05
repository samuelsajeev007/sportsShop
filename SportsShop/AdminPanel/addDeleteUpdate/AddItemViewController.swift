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
    
    @IBOutlet weak var dotLieView: UIView!
    @IBOutlet weak var itemTxtFld: UITextField!
    @IBOutlet weak var itemNameTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        drawDottedLinesAroundView(view: dotLieView)
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
           let quantity = Int(quantityText),
           !quantityText.isEmpty,
           !amountText.isEmpty,
           !itemIdText.isEmpty,
           [0, 1, 2, 3].contains(itemId),
           itemImages.image != nil { 
            do {
               // Initialize Realm
               let realm = try Realm()

               
               if realm.objects(NewItem.self).filter("quantity == %@", quantity).isEmpty {
                   // Quantity doesn't exist, proceed to save the item
                   saveItemToRealm()
                   addLabelOutlet.isHidden = false
               } else {
                   // Quantity already exists, show an alert
                   showQuantityAlreadyExistsAlert()
               }
           } catch let error as NSError {
               // Handle the error gracefully
               print("Error initializing Realm: \(error.localizedDescription)")
           }
       }
        else{
            let alertController = UIAlertController(title: NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("Fill all items", comment: ""), preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
        
        
//        let backViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminHomeViewController") as! AdminHomeViewController
//        navigationController?.pushViewController(backViewController, animated: true)
        
    }
    func showQuantityAlreadyExistsAlert() {
        let alertController = UIAlertController(title: NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("item id already exists", comment: ""), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor(red: 0/255, green: 128/255, blue: 223/255, alpha: 0.7).cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.

        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
    }
    func drawDottedLinesAroundView(view: UIView) {
        drawDottedLine(start: CGPoint(x: view.bounds.minX, y: view.bounds.minY), end: CGPoint(x: view.bounds.maxX, y: view.bounds.minY), view: view)
        drawDottedLine(start: CGPoint(x: view.bounds.maxX, y: view.bounds.minY), end: CGPoint(x: view.bounds.maxX, y: view.bounds.maxY), view: view)
        drawDottedLine(start: CGPoint(x: view.bounds.minX, y: view.bounds.maxY), end: CGPoint(x: view.bounds.maxX, y: view.bounds.maxY), view: view)
        drawDottedLine(start: CGPoint(x: view.bounds.minX, y: view.bounds.minY), end: CGPoint(x: view.bounds.minX, y: view.bounds.maxY), view: view)
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
               let okAction = UIAlertAction(title: "OK", style: .default){ _ in
                   self.navigationController?.popViewController(animated: true)
               }
               
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
    

