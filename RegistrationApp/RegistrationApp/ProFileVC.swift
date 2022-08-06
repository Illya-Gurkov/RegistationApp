//
//  ProFileVC.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 6.08.22.
//

import UIKit

class ProFileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func LogOutAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func deleteAcountAction() {
        UserDefaultService.cleanUserDefauls()
    }
    

}
