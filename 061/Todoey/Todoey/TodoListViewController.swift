//
//  ViewController.swift
//  Todoey
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

class TodoListViewController: UITableViewController {

    // Elements of cells
    var itemArray = ["Find Tim Cook", "Unboxing new iPhone 15", "Eat pizza all day 🍕"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    // We see these funcations in Day 50 with Flash chat app
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // Delegate function
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        // Add/remove a checkmark icon to selected cell
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // Animation "flash gray" when user selects one cell
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Show a pup up view for add a new item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // textField that contains user's task
        var textField = UITextField()
        
        // Create a simple alert and define its action when the user press "Add item"
        let alert = UIAlertController(title: "New to do", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            // What will happen when the user clicks the "Add item" button
            if let userTask = textField.text {
                
                // Add the new task to the array
                self.itemArray.append(userTask)
                
                // Refresh the table view
                self.tableView.reloadData()
            }
            
        }
        
        // Add a text field where user can write
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Your task"
            // Add user's task into lacal variable textField
            // that we can use in UIAlertAction
            textField = alertTextField
        }
        
        // Add the action that we define
        alert.addAction(action)
        
        // Show the alert
        present(alert, animated: true, completion: nil)
    }
}

