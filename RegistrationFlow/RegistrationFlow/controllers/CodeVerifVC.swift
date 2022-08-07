//
//  CodeVerifVC.swift
//  RegistrationFlow
//
//  Created by сергей on 3.08.22.
//

import UIKit

class CodeVerifVC: UIViewController {
    @IBOutlet var ErrorLbl: UILabel! { didSet { ErrorLbl.isHidden = true }}
    
    @IBOutlet var infoLbl: UILabel!
    var userModel: UserModel?
    let secretCode = Int.random(in: 100000 ... 999999)
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDataAndUI()
    }
    
    @IBAction func secretCodeTfAction(_ sender: UITextField) {
        guard let code = (sender.text),
              let codeInt = Int(code),
              codeInt == secretCode
        else {
            let isHidden = sender.text!.count >= 6
            ErrorLbl.isHidden = !isHidden
            return
        }
        ErrorLbl.isHidden = true
        performSegue(withIdentifier: "goToWelcomVC", sender: nil)
    }
    
    private func setupDataAndUI() {
        _ = userModel?.email ?? "your email"
        infoLbl.text = "Please enter code \(secretCode) from \(String(describing: userModel?.email))"
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as?
            WelcomVC
        else {
            return
        }
        vc.userModel = userModel
    }
}
