//
//  ProFileVC.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 6.08.22.
//

import UIKit



protocol editingDelegate {
    func update (meaningOne: String, meaningTwo:String, meaningThree: String)
}

class ProFileVC: UIViewController, editingDelegate {
    func update(meaningOne: String, meaningTwo: String, meaningThree: String) {
        emailLbl.text = meaningOne
        nameLbl.text = meaningTwo
        passLbl.text = meaningThree
    }
    
    var user: UserModal?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
// MARK:- Outlet
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var passLbl: UILabel!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? editingVC {
            vc.email = emailLbl.text!
            vc.name = nameLbl.text!
            vc.pass = passLbl.text!
            vc.delegate = self
        }
    }
    
 
    
    
   // MARK:- Action
    
    @IBAction func LogOutAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
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



