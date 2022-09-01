//
//  editingVC.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 9.08.22.
//

import UIKit

class editingVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var passTF: UITextField!
    
    @IBAction func goEditing() {
        navigationController?.popViewController(animated: true)
        delegate?.update(meaningOne: emailTF.text!, meaningTwo: nameTF.text!, meaningThree: passTF.text!
                         )
        
        dismiss(animated: true, completion: nil)
        
    }
    var email = ""
    var name = ""
    var pass = ""

    
    var delegate: editingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.text = email
        nameTF.text = name
        passTF.text = pass
        
        

        // Do any additional setup after loading the view.
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
