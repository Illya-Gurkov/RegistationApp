//
//  InputViewController.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 31.07.22.
//

import UIKit

class InputViewController: UIViewController {
    @IBOutlet var emailTF: UITextField!
    
    @IBOutlet var errorEmail: UILabel!
    
    @IBOutlet var passTF: UITextField!
    
    @IBOutlet var errorPass: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoggedUser()
    }

    @IBAction func goToRegistrastion(_ sender: UIButton) {}

    @IBAction func signInAction() {
        let userModdel = UserDefaultService.getUserModel(),
        email = emailTF.text,
        pass = passTF.text
        if email == userModdel?.email,
           pass == userModdel?.pass { performSegue(withIdentifier: "goToMain", sender: nil)} else if email != userModdel?.email {errorEmail.isHidden = false }
               
    }
    
    private func isLoggedUser() {
        if let _ = UserDefaultService.getUserModel() {
            performSegue(withIdentifier: "goToMain", sender: nil)
        }
    }
    
    @IBAction func emailTFAct(_ sender: UITextField) {}
    
    override func viewWillAppear(_ animated: Bool) {
        print(UserDefaultService.getUserModel())
    }
}
