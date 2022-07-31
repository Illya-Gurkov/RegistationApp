//
//  InputViewController.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 31.07.22.
//

import UIKit

class InputViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    @IBAction func goToRegistrastion(_ sender: UIButton) {
      performSegue(withIdentifier: "goVC", sender: nil)
    }
    
  

}
