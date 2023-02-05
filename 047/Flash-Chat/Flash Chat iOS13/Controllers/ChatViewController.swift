//
//  ChatViewController.swift
//  Flash Chat iOS13
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
    
    // Array of Message obj. Every Message have a sender and a text message body
    let messages: [Message] = [
        Message(sender: "Simone", body: "sup bro?"),
        Message(sender: "Sol", body: "a w e s o m e! u?"),
        Message(sender: "Simone", body: "WoW, so much passion!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Trigger the delegate for get the data from tableView
        tableView.dataSource = self
        // Hide back button and leave only the Log Out button
        navigationItem.hidesBackButton = true
        // Set title to nagigation bar
        title = K.appInfo.chatTitle
        
        // Use the custum design of MessageCell.xib (tableview.register for register a new nib)
        // nib = NIBs and XIBs are files that describe user interfaces
        // We create a new UI for nib (UINib) and initialize it with a nibName (the name of the file, in this case MessageCell)
        // forCellReuseIdentifier uses the name of single cell we have created (ReusableCell)
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
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

// When the table view is load, It takes a request for data (message)
// First func tell how many cells we need
// Second func takes the tada and populate the single cell
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return number of messages present into the array messages
        return messages.count
    }
    
    // This method will call n° times as the number of return messages.count
    // In this case return messages.count = 3, so we create three cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a cell of table view and return it
        // withIdentifier = name of cell we have called in Main.stroyboard
        // indexPath = n° of cell
        // as! for cast this as MessageCell class
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        // print the number of each cell (0,1,2) = 3 Message into message
        // cell.textLabel?.text = String(indexPath.row)
    
        // Print message body
        cell.label.text = messages[indexPath.row].body
        
        return cell
    }
}


/*
 
// Trigger the delegate when user touches a cell from tableview
tableView.delegate = self  (write this in viewDidLoad)

// When the user touches one cell into tableview
extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
*/
