//
//  WelcomeVC.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 5.08.22.
//

import UIKit

final class WelcomeVC: UIViewController {
    
    @IBOutlet private weak var infoLbl: UILabel!
    
    
    var userModel: UserModal?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueAction() {
        guard let userModel = userModel else {
            return
        }

        UserDefaultService.saveUserModel(userModel: userModel)
        
        navigationController?.popToRootViewController(animated: true)
        
        
    }
    private func setupUI(){
        let name = userModel?.name ?? "User"
        infoLbl.text = "\(name) welcome to our Cool App"
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
