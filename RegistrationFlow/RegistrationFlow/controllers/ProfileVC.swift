//
//  ProfileVC.swift
//  RegistrationFlow
//
//  Created by сергей on 6.08.22.
//

import UIKit

class ProfileVC: UIViewController {

  
    

    @IBAction func logOutAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    @IBAction func deleteAction(_ sender: Any) {
        userDefault.cleanUserDefauls()
        
    }
    
   
}
