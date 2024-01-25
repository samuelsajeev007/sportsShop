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
        setupBackgroundAnimation()
        loginBtnOutlet.layer.cornerRadius = 12
        logoImageOutlets.layer.cornerRadius = 0.5 * logoImageOutlets.bounds.size.width
        // self.navigationController?.isNavigationBarHidden = true
        print(Realm.Configuration.defaultConfiguration.fileURL)//get url for database realm
    }
    
    
    @IBAction func loginBtnAction(_ sender: Any) {
        guard let enteredUsername = userNameTxtFld.text, !enteredUsername.isEmpty,
              let enteredPassword = passwordTxtFld.text, !enteredPassword.isEmpty else {
            // Handle the case where username or password is empty
            return
        }
        
        if enteredUsername == "Samuel" && enteredPassword == "samuel123" {
            // Navigate to adminViewController
            let adminViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminHomeViewController") as! AdminHomeViewController
            navigationController?.pushViewController(adminViewController, animated: true)
        } else {
            let regDetails = try! Realm()
            let validate = regDetails.objects(UserDetails.self)
            
            if let matchedUser = validate.filter("username == %@", enteredUsername).first,
               enteredPassword == matchedUser.password {
                // Navigate to HomeViewController
                let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                navigationController?.pushViewController(homeViewController, animated: true)
            } else {
                // Show alert for invalid credentials
                let alertController = UIAlertController(title: NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("Invalid credentials. Please try again.", comment: ""), preferredStyle: .alert)
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
    private func setupBackgroundAnimation() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor(red: 128/255, green: 217/255, blue: 88/255, alpha: 1).cgColor] // Set the colors you want
            gradientLayer.locations = [0.0, 1.0]
            
            let animation = CABasicAnimation(keyPath: "locations")
            animation.fromValue = [0.0, 0.0]
            animation.toValue = [0.0, 1.0]
            animation.duration = 3.0 // Set the duration of the animation (in seconds)
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            gradientLayer.add(animation, forKey: "animateGradient")
            
            view.layer.insertSublayer(gradientLayer, at: 0)
        }
}

