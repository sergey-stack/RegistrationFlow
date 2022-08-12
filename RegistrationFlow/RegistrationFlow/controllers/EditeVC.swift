//
//  EditeVC.swift
//  RegistrationFlow
//
//  Created by сергей on 12.08.22.
//

import UIKit

class EditeVC: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    var delegate: EditingDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.text = email
        nameTF.text = name
        passwordTF.text = pass
        

        
    }
    
    
    @IBAction func EditeButton() {
        navigationController?.popViewController(animated: true)
        delegate?.update(meaningOne: emailTF.text!, meaningTwo: nameTF.text!, meaningThrea: passwordTF.text!)
        dismiss(animated: true, completion: nil)
        
    }
   
    
    var email = ""
    var name = ""
    var pass = ""
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
