//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        // aa, bb = if a!=nil AND b!=nil
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            // Firebase code for create a new users
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                // Menage eventual errors
                if let err = error {
                    print(err.localizedDescription)
                } else {
                    // User correctly register so nagivate to RegisterToChat page
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
        
    }
    
    
}
