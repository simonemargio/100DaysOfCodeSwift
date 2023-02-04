//
//  ChatViewController.swift
//  CookieChat
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hide back button and leave only the Log Out button
        navigationItem.hidesBackButton = true
        // Set title to nagigation bar
        title = "Chat 😎"
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        // Firebase code for log out the user
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            // Send the user to ROOT (in this case WelcomeViewController) screen
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
}
