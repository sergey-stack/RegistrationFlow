//
//  SignUpVC.swift
//  RegistrationFlow
//
//  Created by сергей on 2.08.22.
//

import UIKit

final class SignUpVC: UIViewController {
    // MARK: -  @IBOutlets
    
    @IBOutlet private var emailTF: UITextField!
    
    @IBOutlet private var errorEmailLbl: UILabel!
    
    @IBOutlet private var nameTF: UITextField!
    
    @IBOutlet private var passwordTF: UITextField!
    
    @IBOutlet private var errorPassLbl: UILabel!
    
    @IBOutlet var strongPassIndicationViews: [UIView]!
    
    @IBOutlet private var confPassTF: UITextField!
    
    @IBOutlet private var errorConfLbl: UILabel!
    
    @IBOutlet var scrollView: UIScrollView!
    
    // MARK: -  Properties
    
    private var isValidEmail = false { didSet { updateContinueBtnState() }}
    private var isConfPass = false { didSet { updateContinueBtnState() }}
    private var passwordStrength: PasswordStrength = .veryWeak { didSet { updateContinueBtnState() }}
    
    // MARK: - Life Cycle
    
    @IBOutlet var continueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        startKeyboardObservers()
    }

    /// Keyboard Observe-s
    
    private func startKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardSize =
            (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
            return
        }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc private func keyboardWillHide() {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    // MARK: - Func-s
    
    @IBAction func emailTfAction(_ sender: UITextField) {
        if let email = sender.text,
           !email.isEmpty,
           VerificationService.isValidEmail(email: email)
        {
            isValidEmail = true
        } else {
            isValidEmail = false
        }
        errorEmailLbl.isHidden = isValidEmail
    }
    
    @IBAction func passTfAction(_ sender: UITextField) {
        if let passText = sender.text,
           !passText.isEmpty
        {
            passwordStrength = VerificationService.isValidPassword(pass: passText)
        }
        errorPassLbl.isHidden = passwordStrength != .veryWeak
        sutupStrongPassIndicationViews()
    }
    
    @IBAction func confPassTfAction(_ sender: UITextField) {
        if let confPassText = sender.text,
           !confPassText.isEmpty,
           let passText = passwordTF.text,
           !passText.isEmpty
        {
            isConfPass = VerificationService.isPassCofirm(pass1: passText, pass2: confPassText)
        } else {
            isConfPass = false
        }
        errorConfLbl.isHidden = isConfPass
        sutupStrongPassIndicationViews()
    }
    
    @IBAction func sigInBtAction() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func continueBtAction() {
        if let email = emailTF.text,
           let name = nameTF.text,
           let pass = passwordTF.text
        {
            let userModel = UserModel(name: nameTF.text, email: email, pass: pass)
            performSegue(withIdentifier: "goToCodeVerifVC", sender: userModel)
        }
    }
    
    // MARK: -  Func-s

    private func sutupStrongPassIndicationViews() {
        strongPassIndicationViews.enumerated().forEach { index, view in
            if index <= (passwordStrength.rawValue - 1) {
                view.alpha = 1
            } else {
                view.alpha = 0.1
            }
        }
    }
    
    private func updateContinueBtnState() {
        continueButton.isEnabled = isValidEmail && isConfPass && passwordStrength != .veryWeak
    }
        
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let codeVerifVC = segue.destination as? CodeVerifVC,
           let userModel = sender as? UserModel { codeVerifVC.userModel = userModel }
    }
}
