//
//  RegViewController.swift
//  SportsShop
//
//  Created by apple on 15/01/24.
//

import UIKit
import DropDown
import RealmSwift
//var genderIs = String()

class RegViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var usrNameTxtFld: UITextField!
    @IBOutlet weak var phNumberTxtFld: UITextField!
    @IBOutlet weak var ageTxtFld: UITextField!
    @IBOutlet weak var dobViewDropDown: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var regBtnOutlet: UIButton!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var dropLabel: UILabel!
    
    let dropDown = DropDown()
    let dropDownValues = ["Female","Male"]
    var genderIs: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //setupBackgroundAnimations()
        regBtnOutlet.layer.cornerRadius = 12
        logoImageView.layer.cornerRadius = 0.5 * logoImageView.bounds.size.width
        regBtnOutlet.layer.borderWidth = 2
        regBtnOutlet.layer.borderColor = UIColor(red: 0/255, green: 128/255, blue: 223/255, alpha: 0.7).cgColor
        //dobViewDropDown.layer.masksToBounds = true
//        dobViewDropDown.layer.cornerRadius = 4
//        dropDown.dataSource = dropDownValues
//        dropDown.width = dobViewDropDown.frame.width
//        dropDown.cornerRadius = 12
//        dropDown.backgroundColor = .white
//        dobViewDropDown.layer.borderWidth = 1
//        dobViewDropDown.layer.borderColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 0.4).cgColor
        usrNameTxtFld.delegate = self
        phNumberTxtFld.delegate = self
        phNumberTxtFld.keyboardAppearance = .default

    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
           if textField == usrNameTxtFld {
               usrNameTxtFld.becomeFirstResponder()
           } else {
           }
            if textField == phNumberTxtFld {
                phNumberTxtFld.becomeFirstResponder()
            } else {
            }
       }
    //becomeFirstResponder()
    @IBAction func showDropDown(_ sender: Any) {
        //dropDown.anchorView = drpDwnView
        dropDown.show()
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.dropLabel.text = item
            self?.dropLabel.textColor = .black
//            if let genderIsStore = self?.dropLabel.text {
//                print(genderIsStore)
//                if genderIsStore == "Female"{
//                    genderIs = "Female"
//                }
//                else{
//                    genderIs = "Male"
//                }
//            }
//                
//                else {
//                    print("Label text is nil")
//                }
            self?.genderIs = item
            print("Selected Gender: \(item)")
                
            }
        }
    
    @IBAction func backButtonMain(_ sender: Any) {
        let backViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(backViewController, animated: true)
    }
    
    @IBAction func regAction(_ sender: Any) {
//        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
//                    navigationController?.pushViewController(secondViewController, animated: true)
        
        if phNumberTxtFld.text != "" && phNumberTxtFld.text?.count == 10 && passwordOutlet.text != "" && ageTxtFld.text != "" && ageTxtFld.text?.count == 2 && usrNameTxtFld.text != "" && genderIs != ""{
            
            let regDetails = try! Realm()
            let person = UserDetails()
            person.username = usrNameTxtFld.text
            person.age = ageTxtFld.text
            person.phNumber = phNumberTxtFld.text
            person.password = passwordOutlet.text
           // person.gender = genderIs
            
            try! regDetails.write{
                 regDetails.add(person)
            }
                    let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
                                navigationController?.pushViewController(secondViewController, animated: true)
                    
        }
        else{
            let alertController = UIAlertController(title: "Error", message: "Please fill  the all required fields.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    present(alertController, animated: true, completion: nil)
        }
    }
    

}
//extension UIViewController{
//        func setupBackgroundAnimations() {
//            let gradientLayer = CAGradientLayer()
//            gradientLayer.frame = view.bounds
//        gradientLayer.colors = [UIColor.clear.cgColor, UIColor(red: 128/255, green: 217/255, blue: 88/255, alpha: 1).cgColor] // Set the colors you want
//            gradientLayer.locations = [0.0, 1.0]
//                        view.layer.insertSublayer(gradientLayer, at: 0)
//        }
//}
