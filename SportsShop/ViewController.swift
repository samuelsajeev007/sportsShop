//
//  ViewController.swift
//  SportsShop
//
//  Created by apple on 15/01/24.
//

import UIKit
import RealmSwift
class UserData {
    static let shared = UserData()
    var firstLetter: String?
}

class ViewController: UIViewController {
    //outlets
    @IBOutlet weak var logoImageOutlets: UIImageView!
    @IBOutlet weak var userNameTxtFld: UITextField!
    @IBOutlet weak var loginBtnOutlet: UIButton!
    
    @IBOutlet weak var regBtnOutlet: UIButton!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginBtnOutlet.layer.cornerRadius = 12
        logoImageOutlets.layer.cornerRadius = 0.5 * logoImageOutlets.bounds.size.width
       // self.navigationController?.isNavigationBarHidden = true
        print(Realm.Configuration.defaultConfiguration.fileURL)//get url for database realm
    }
    

    @IBAction func loginBtnAction(_ sender: Any) {
        guard let username = userNameTxtFld.text else {
                // Handle the case where the username is empty
                return
            
            }

            // Capitalize the first letter of the username
            let capitalizedUsername = capitalizeFirstLetter(username)

            // Get the first letter of the capitalized username
            let firstLetter = String(capitalizedUsername.prefix(1))

            // Store the first letter in the shared instance
            UserData.shared.firstLetter = firstLetter
//        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//                    navigationController?.pushViewController(secondViewController, animated: true)
        let regDetails = try! Realm()
        let validate = regDetails.objects(UserDetails.self)
        guard let enteredUsername = userNameTxtFld.text else {
                    return
                }
        if let matchedUser = regDetails.objects(UserDetails.self).filter("username == %@", enteredUsername).first {
            let enteredPassword = passwordTxtFld.text ?? ""
            
            if enteredPassword == matchedUser.password {
                        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                                    navigationController?.pushViewController(secondViewController, animated: true)
            }
        }
        else{
            if userNameTxtFld.text != "" && passwordTxtFld.text != ""{
                let alertController = UIAlertController(title: "Alert", message: "You have no account. Please register.", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(okAction)
                        present(alertController, animated: true, completion: nil)
            }else{
                let alertController = UIAlertController(title: "Alert", message: "Please enter username and password", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(okAction)
                        present(alertController, animated: true, completion: nil)
            }
        }
    }
   
    private func capitalizeFirstLetter(_ str: String) -> String {
            return str.prefix(1).capitalized + str.dropFirst()
        }
    
    @IBAction func regBtnAction(_ sender: Any) {
        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegViewController") as! RegViewController
                    navigationController?.pushViewController(secondViewController, animated: true)
    }
}

