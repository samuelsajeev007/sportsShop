//
//  ProfileViewController.swift
//  SportsShop
//
//  Created by apple on 15/01/24.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var profileButnOutlet: UIButton!
    @IBOutlet weak var profileTableView: UITableView!
    var profileOptions = ["My PhoneNo","My Bookings","Switch mode Dark/Light"]
    
    @IBOutlet weak var backBtnOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if darkMode{
            view.overrideUserInterfaceStyle = .dark
            view.alpha = 0.8
            backBtnOutlet.setBackgroundImage(UIImage(named: "backWhite"), for: .normal)
        }
        else{
            view.overrideUserInterfaceStyle = .light
        }
//        setupBackgroundAnimations()
        profileTableView.register(UINib(nibName: "ProfileListTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileListTableViewCell")
        logoImageView.layer.cornerRadius = 0.5 * logoImageView.bounds.size.width
        profileButnOutlet.layer.cornerRadius = 0.5 * profileButnOutlet.bounds.size.width
        if let username = UserData.shared.firstLetter {
                    // Use the username as needed
            profileButnOutlet.setTitle(username, for: .normal)
                }
    }
    
    @IBAction func backButtonMain(_ sender: Any) {
        let backViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(backViewController, animated: true)
    }
    
  
}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "ProfileListTableViewCell", for: indexPath)as! ProfileListTableViewCell
        cell.profileLabelOptions.text = profileOptions[indexPath.row]
        if indexPath.row == 0{
            cell.profileLabelOptions.text = storeUserName
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 1:
            let myBookViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserBookingViewController") as! UserBookingViewController
            navigationController?.pushViewController(myBookViewController, animated: true)
        case 2:
            let alertController = UIAlertController(title: NSLocalizedString("Alert", comment: ""), message: NSLocalizedString("Want to Switch mode", comment: ""), preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { [self] (_) in
                if iconClick {
                     darkMode = true
                    let backViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    navigationController?.pushViewController(backViewController, animated: true)
                     
                      } else {
                          darkMode = false

                          let backViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                          navigationController?.pushViewController(backViewController, animated: true)
                    }
                iconClick = !iconClick

            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        default:
            print("issue in profile page")
        }
    }
    
    
}
