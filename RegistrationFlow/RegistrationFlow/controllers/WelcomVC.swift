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

        setupUI()
    }

    @IBAction func continueAction() {
        guard let userModel = userModel else {
            return
        }

        userDefault.saveUserModel(userModel: userModel)
        navigationController?.popToRootViewController(animated: true)
    }

    private func setupUI() {
        let name = userModel?.name ?? "User"
        infoLbl.text = "\(name) welcom to our Cool App"
    }
}
