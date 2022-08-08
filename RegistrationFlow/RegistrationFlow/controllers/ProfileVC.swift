//
//  ProfileVC.swift
//  RegistrationFlow
//
//  Created by сергей on 6.08.22.
//

import UIKit

class ProfileVC: UIViewController {

    var user: UserModel?
    @IBOutlet weak var infoUser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
}
    

    @IBAction func logOutAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    @IBAction func deleteAction(_ sender: Any) {
        userDefault.cleanUserDefauls()
        
    }
    
    private func setupUI() {
        let name = UserDefaults.standard.string(forKey: "email")
        infoUser.text = name
   
    }
}
