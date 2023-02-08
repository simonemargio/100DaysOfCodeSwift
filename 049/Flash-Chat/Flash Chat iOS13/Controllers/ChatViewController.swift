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
    
    // Reference to db
    let db = Firestore.firestore()
    
    // Array of testing Message obj. Every Message have a sender and a text message body
    var messages: [Message] = [
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
        
        // Read from Firestone db all message
        loadMessages()
        
    }
    
    func loadMessages() {
        // Clear testing message and read "very" messages from db
        messages = []
        
        db.collection(K.FStore.collectionName).getDocuments { querySnapshot, error in
            if let err = error {
                print("There was an error with retriving messages from Firestore DB.\nError:\(err)")
            } else {
                // Get messages
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        // data() is a dictionary
                        // Exemple: ["sender": simonemargio@wow.com, "body": first message into Firestore!!]
                        // print(doc.data())
                        let data = doc.data()
                        // Decompose the dictionary
                        // let sender have declaration: let sender: Any?. We're using a downcast (as?) to return it to string
                        // now sender have declaration: let sender: String
                        // same with messageBody
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            // Create a message
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            // Add the message to array messages
                            self.messages.append(newMessage)
                            // Trigger the functions to manage and view the elements of the table view
                            // As we manipulate the interface, we run the message update code in the background
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
        
       
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        // Save the message body and the sender email
        // Every message is Message in Model folder
        if let messageBody = messageTextfield.text, let messageSender =  Auth.auth().currentUser?.email {
            // messageBody and messageSender are both != nil
            
            // Call "messages" the db collections name and send to db:
            // [K.FStore.senderField: messageSender, K.FStore.bodyField] = ["sender": "simonemargio@wow.com", "body": "sup bro?"]
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField: messageSender, K.FStore.bodyField: messageBody]) { (error) in
                if let err = error {
                    print("There was an error with the Firestore DB.\nError:\(err)")
                } else {
                    print("Data saved succesfully into Firestore db!")
                }
            }
        }
        
        
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
