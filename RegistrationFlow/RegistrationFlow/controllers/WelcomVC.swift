//
//  WelcomVC.swift
//  RegistrationFlow
//
//  Created by сергей on 6.08.22.
//

import UIKit

final class WelcomVC: UIViewController {
    @IBOutlet private var infoLbl: UILabel!

    var userModel: UserModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func continueAction() {
        guard let userModel = userModel else {
            return
        }

        userDefault.saveUserModel(userModel: userModel)
        navigationController?.popToRootViewController(animated: true)
    }

   
}
