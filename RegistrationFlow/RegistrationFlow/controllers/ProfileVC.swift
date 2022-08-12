//
//  ProfileVC.swift
//  RegistrationFlow
//
//  Created by сергей on 6.08.22.
//

import UIKit


protocol EditingDelegate {
    func update (meaningOne: String, meaningTwo: String, meaningThrea: String)
    
}

class ProfileVC: UIViewController, EditingDelegate {
    func update(meaningOne: String, meaningTwo: String, meaningThrea: String) {
        infoUser.text = meaningOne
        nameLbl.text = meaningTwo
        passLbl.text = meaningThrea
        
        
    }
    

    var user: UserModel?
    @IBOutlet weak var infoUser: UILabel!
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
    @IBOutlet weak var passLbl: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditeVC {
            vc.email = infoUser.text!
            vc.name = nameLbl.text!
            vc.pass = passLbl.text!
            vc.delegate = self
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
}
    
    
    @IBAction func emailTfAct(_ sender: UITextField) {
        
        
    }
    
    
    

    @IBAction func logOutAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    @IBAction func deleteAction(_ sender: Any) {
        userDefault.cleanUserDefauls()
        
    }
    
    private func setupUI() {
        let email = UserDefaults.standard.string(forKey: "email")
        infoUser.text = email
       let  name = UserDefaults.standard.string(forKey: "name")
        nameLbl.text = name
        let pass = UserDefaults.standard.string(forKey: "password")
        passLbl.text = pass
    }
    
   
}


