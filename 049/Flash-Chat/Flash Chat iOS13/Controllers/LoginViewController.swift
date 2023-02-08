//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        // aa, bb = if a!=nil AND b!=nil
               if let email = emailTextfield.text, let password = passwordTextfield.text {
                   // Firebase code for autenticate existing user
                   Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                       // Menage eventual errors
                       if let err = error {
                           print(err)
                       } else {
                           // User correctly login so nagivate to LoginToChat page
                           self.performSegue(withIdentifier: K.loginSegue, sender: self)
                        
                       }
                   }
               }

        
    }
    
}
