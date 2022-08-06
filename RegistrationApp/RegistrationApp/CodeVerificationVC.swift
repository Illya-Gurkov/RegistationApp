//
//  CodeVerificationVC.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 3.08.22.
//

import UIKit

class CodeVerificationVC: UIViewController {
    
    
    @IBOutlet weak var infoLbl: UILabel!
    
    @IBOutlet weak var errorLBL: UILabel! { didSet {errorLBL.isHidden = true }}
    
    
    
    

    var userModel: UserModal?
    let secretCode = Int.random(in: 100000...999999)
    override func viewDidLoad() {
        super.viewDidLoad()
setupDataAndUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func secterCodeTF(_ sender: UITextField) {
        guard let code = (sender.text),
              let codeInt = Int(code),
              codeInt == secretCode else {
                  let isHidden = sender.text!.count >= 6
                  errorLBL.isHidden = !isHidden
            return
        }
        errorLBL.isHidden = true
        performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
    }
    private func setupDataAndUI() {
        let email = userModel?.email ?? "your email"
        infoLbl.text = "Please enter code \(secretCode) from \(userModel?.email)"
    }
    
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? WelcomeVC
    else { return }
        vc.userModel = userModel
}
}
