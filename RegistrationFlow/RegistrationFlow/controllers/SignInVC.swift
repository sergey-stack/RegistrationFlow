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
    var user: UserModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoggedUser()
    }

    @IBAction func signInAction() {
        let userModel = userDefault.getUserModel(),
          email = emailTF.text,
            pass = passTF.text
          if email == userModel?.email,
           pass == userModel?.pass { performSegue(withIdentifier: "goToMain", sender: nil) } else if  email != userModel?.email { errorEmail.isHidden = false }
    
    }

    private func isLoggedUser() {
        if let _ = userDefault.getUserModel() {
            performSegue(withIdentifier: "goToMain", sender: nil)
        }
    }
    
     // MARK: - Navigation

     
    // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       //  guard let vc = segue.destination as? ProfileVC
       //  else { return }
       //  vc.user = user
        
     }
     

