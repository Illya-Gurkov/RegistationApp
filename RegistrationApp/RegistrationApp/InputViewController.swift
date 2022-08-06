//
//  InputViewController.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 31.07.22.
//

import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var errorEmail: UILabel!
    
    @IBOutlet weak var passTF: UITextField!
    
    @IBOutlet weak var errorPass: UILabel!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        isLoggedUser ()

     
    }
    @IBAction func goToRegistrastion(_ sender: UIButton) {
   
    }
    @IBAction func signInAction() {
        if let email = emailTF.text,
           let pass = passTF.text,
            let userModel = UserDefaultService.getUserModel(), email == userModel.email, pass == userModel.pass {
            performSegue(withIdentifier: "goToMain", sender: nil)
        }
    }
    
    private func isLoggedUser() {
        if let _ = UserDefaultService.getUserModel() {
            performSegue(withIdentifier: "goToMain", sender: nil)
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
print (UserDefaultService.getUserModel())
    }
  

}
