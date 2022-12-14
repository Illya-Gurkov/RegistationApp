//
//  SignUpVC.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 2.08.22.
//

import UIKit

final class SignUpVC: UIViewController {
    // - MARK: - @IBOutlets
    @IBOutlet private var emailTF: UITextField!
    
    @IBOutlet private var errorEmailLbl: UILabel!
    
    @IBOutlet private var nameTF: UITextField!
    @IBOutlet private var passwordTF: UITextField!
    @IBOutlet private var errorPassLbl: UILabel!
    
    @IBOutlet private var indicatorsViews: [UIView]!
    
    @IBOutlet private var confPassTF: UITextField!
    
    @IBOutlet private var errorConfPassLbl: UILabel!
    
    @IBOutlet private var signUpBtn: UIButton!
    
    @IBOutlet private var scrollView: UIScrollView!
    
    // MARK: - Properties

    private var isValidEmail = false { didSet { updateSignUp() } }
    private var isConfPass = false { didSet { updateSignUp() } }
    private var passwordStrength: PasswordStrength = .veryWeak { didSet { updateSignUp() } }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        startKeyboardObservers()
    }

    // MARK: - Func-s
    
    @IBAction func emailTFAction(_ sender: UITextField) {
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
    
    @IBAction func passTFAction(_ sender: UITextField) {
        if let passText = sender.text,
           !passText.isEmpty
        {
            passwordStrength = VerificationService.isValidPassword(pass: passText)
        }
        errorPassLbl.isHidden = passwordStrength != .veryWeak
        sutupView()
    }
    
    @IBAction func confPassTFAction(_ sender: UITextField) {
        if let confPassText = sender.text,
           !confPassText.isEmpty,
           let passText = passwordTF.text,
           !passText.isEmpty
        {
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
        if let email = emailTF.text,
           let pass = passwordTF.text
        {
            let userModel = UserModal(name: nameTF.text, email: email, pass: pass)
            performSegue(withIdentifier: "goToCodeVerificationVC", sender: userModel)
        }
    }

    // MARK: - Fun-s
    
    private func sutupView() {
        indicatorsViews.enumerated().forEach { index, view in
            if index <= (passwordStrength.rawValue - 1) {
                view.alpha = 1
            } else {
                view.alpha = 0.1
            }
        }
    }
    
    private func updateSignUp() {
        signUpBtn.isEnabled = isValidEmail && isConfPass && passwordStrength != .veryWeak
    }
    
    /// keyboard Observer-s
   
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
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let codeVeriVC = segue.destination as? CodeVerificationVC,
           let userModel = sender as? UserModal
        {
            codeVeriVC.userModel = userModel
        }
    }
}
