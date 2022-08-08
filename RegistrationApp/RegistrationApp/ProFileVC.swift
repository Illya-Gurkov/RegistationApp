//
//  ProFileVC.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 6.08.22.
//

import UIKit

class ProFileVC: UIViewController {
    var user: UserModal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
// MARK:- Outlet
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var passLbl: UILabel!
    
    
    @IBAction func emailTF(_ sender: UITextField) {
    }
    
    
    
   // MARK:- Action
    
    @IBAction func LogOutAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func emailTFAct(_ sender: UITextField) {
    }
    
    @IBAction func deleteAcountAction() {
        UserDefaultService.cleanUserDefauls()
    }
    
  
    
    
    
    
    
    
    
    private func setupUI() {
        let email = UserDefaults.standard.string(forKey: "email")
        emailLbl.text = email
        let name = UserDefaults.standard.string(forKey: "name")
        nameLbl.text = name
        let pass = UserDefaults.standard.string(forKey: "password")
        passLbl.text = pass
    }
}
