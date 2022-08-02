//
//  SignUpVC.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 2.08.22.
//

import UIKit

final class SignUpVC: UIViewController {

    // - MARK: - @IBOutlets
    @IBOutlet private weak var emailTF: UITextField!
    
    @IBOutlet private weak var errorEmailLbl: UILabel!
    
    @IBOutlet private weak var nameTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var errorPassLbl: UILabel!
    
    @IBOutlet private var indicatorsViews: [UIView]!
    
    
    @IBOutlet private weak var confPassTF: UITextField!
    
    @IBOutlet private weak var errorConfPassLbl: UILabel!
    
    @IBOutlet private weak var signUpBtn: UIButton!
    
    // MARK: - Properties
    private var isValidEmail = false { didSet { updateSignUp()} }
    private var isConfPass = false { didSet { updateSignUp()} }
    private var passwordStrength: PasswordStrength = .veryWeak { didSet { updateSignUp()} }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    // MARK: - Func-s
    
    @IBAction func emailTFAction(_ sender: UITextField) {
        if let email = sender.text,
           !email.isEmpty,
           VerificationService.isValidEmail(email: email){
            isValidEmail = true
        } else {
            isValidEmail = false
        }
        errorEmailLbl.isHidden = isValidEmail
    }
    
    @IBAction func passTFAction(_ sender: UITextField) {
        if let passText = sender.text,
           !passText.isEmpty{
            passwordStrength = VerificationService.isValidPassword(pass: passText)
        }
        errorPassLbl.isHidden = passwordStrength != .veryWeak
        sutupView()
    }
    
    
    @IBAction func confPassTFAction(_ sender: UITextField) {
        if let confPassText = sender.text,
           !confPassText.isEmpty,
           let passText = passwordTF.text,
           !passText.isEmpty {
            isConfPass = VerificationService.isPassCofirm(pass1: passText, pass2: confPassText)
        } else {
            isConfPass = false
        }
        errorConfPassLbl.isHidden = isConfPass
    }
    
    @IBAction func signInBtnAction() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func SignUpActionBtn() {
    }
    // MARK: - Fun-s
    
    private func sutupView() {
        indicatorsViews.enumerated().forEach { index, view in
            if index <= (passwordStrength.rawValue - 1) {
                view.alpha = 1
            }  else {
                view.alpha = 0.1
            }
        }
    }
    
    private func updateSignUp() {
        signUpBtn.isEnabled = isValidEmail && isConfPass && passwordStrength != .veryWeak
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

