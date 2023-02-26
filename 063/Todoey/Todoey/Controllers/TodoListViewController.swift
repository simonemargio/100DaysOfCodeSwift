//
//  ViewController.swift
//  Todoey
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit

class TodoListViewController: UITableViewController {


    // Array of Item objects
    var itemArray = [Item]()
    
    
    // Create a "file path" to the document folder
    // With "FileManager" we can interface to the contents into file system
    // "default" returns the shared file manager (it's a singleton, an array of URLs)
    // .documentDirectory we can access to a document directory
    // .userDomainMask we can access to the user's home directory (here we'll save the app data)
    // Take the first array's item
    // Instead of using UsersDefault, we create own plist file "Items"
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Path where load/save the items
        print(dataFilePath!)
        
        loadItems()
        
        
        // Load items from saved file
        func loadItems() {
            if let data = try? Data(contentsOf: dataFilePath!) {
                let decoder = PropertyListDecoder()
                do {
                     itemArray = try decoder.decode([Item].self, from: data)
                } catch {
                    print("Error decoding item array!\n\(error)")
                }
               
            }
        }
        
        
    }
    
    // We see these funcations in Day 50 with Flash chat app
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // The cells are reused, so when the user scrolls down some cells are "hidden" (depending on the size of the screen I can have a number of cells visible,
        // but if I have many elements I have to scroll the list). These cells are reused to show all other items when scrolling through the list.
        // It is therefore necessary to check if each element has the .check enabled or not.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
         
        let item = itemArray[indexPath.row]
        
        // Set the title of cell and checkmark
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done == true ? .checkmark: .none
        
        return cell
    }
    
    
    // Delegate function
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        // Add/remove a checkmark icon to selected cell
        itemArray[indexPath.row].done =  !itemArray[indexPath.row].done
        
        // Save the new item
        saveItem()
        
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
                
                // Add the new task to an Item
                // and add it on array
                var newItem = Item()
                newItem.title = userTask
                self.itemArray.append(newItem)
                // Save new item
                self.saveItem()

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
    
    func saveItem() {
        // Save the array persistently
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(self.itemArray)
            try data.write(to: self.dataFilePath!)
        } catch {
            print("Error encoding item array!\n\(error)")
        }
        
        // Refresh the table view
        self.tableView.reloadData()
    }
    
}

