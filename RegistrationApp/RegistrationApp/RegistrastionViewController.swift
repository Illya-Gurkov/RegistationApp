//
//  RegistrastionViewController.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 31.07.22.
//

import UIKit

class RegistrastionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func goToSignIn(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
  
}
