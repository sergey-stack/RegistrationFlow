//
//  SignInVC.swift
//  RegistrationFlow
//
//  Created by сергей on 1.08.22.
//

import UIKit

class SignInVC: UIViewController {
    @IBOutlet var errorPass: UILabel!
    @IBOutlet var passTF: UITextField!
    @IBOutlet var errorEmail: UILabel!
    @IBOutlet var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoggedUser ()
    }

    @IBAction func signInAction() {
        if let email = emailTF.text,
           let pass = passTF.text,
           let userModel = userDefault.getUserModel(),
           email == userModel.email,
           pass == userModel.pass {}
        performSegue(withIdentifier: "goToMain", sender: nil)
    }

    private func isLoggedUser () {
        if let _ = userDefault.getUserModel() {
            performSegue(withIdentifier: "goToMain", sender: nil)
        }
        
    }
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
