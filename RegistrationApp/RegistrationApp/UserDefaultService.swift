//
//  UserDefaultService.swift
//  RegistrationApp
//
//  Created by Illya Gurkov on 6.08.22.
//

import Foundation

final class UserDefaultService {
    
    static func saveUserModel (userModel: UserModal) {
        UserDefaults.standard.set(userModel.name, forKey: UserDefaults.Keys.name.rawValue)
        UserDefaults.standard.set(userModel.email, forKey: UserDefaults.Keys.email.rawValue)
        UserDefaults.standard.set(userModel.pass, forKey: UserDefaults.Keys.password.rawValue)
    }
    
    static func getUserModel () -> (UserModal?) {
       let name = UserDefaults.standard.string(forKey: UserDefaults.Keys.name.rawValue)
       guard let email = UserDefaults.standard.string(forKey: UserDefaults.Keys.email.rawValue),
        let password = UserDefaults.standard.string(forKey: UserDefaults.Keys.password.rawValue) else { return nil }
    let userModel = UserModal(name: name, email: email, pass: password)
        return userModel
    }
    static func cleanUserDefauls() {
        UserDefaults.standard.reset()
    }
}
