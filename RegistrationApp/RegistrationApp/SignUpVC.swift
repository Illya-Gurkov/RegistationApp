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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Func-s
    
    @IBAction func emailTFAction(_ sender: UITextField) {
    }
    
    @IBAction func passTFAction(_ sender: UITextField) {
    }
    
    
    @IBAction func confPassTFAction(_ sender: UITextField) {
    }
    
    @IBAction func signInBtnAction() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func SignUpActionBtn() {
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
