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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupBackgroundAnimations()
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "ProfileListTableViewCell", for: indexPath)as! ProfileListTableViewCell
        return cell
    }
    
    
}
