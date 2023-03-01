//
//  ViewController.swift
//  Todoey
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit
import CoreData


class TodoListViewController: UITableViewController {

    // Array of Item objects
    var itemArray = [Item]()
    
    // Type of list category
    // Es: Home, Work, Shppong list
    var selectedCategory: Category? {
        didSet {
            // Call this when selectedCategory has a value
            // Load list's elements
            loadItems()
        }
    }
    
    // Tapping into the UIApplication class
    // we're getting the shared singleton obj which corresponds to the current app as an ogj
    // tapping into delegate which has the data type of an optional UIApplicationDelegate
    // we cast it into our class AppDelegate
    // and we have access to our AppDelegate as an obj
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
        //print(dataFilePath!)
        //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Reaload all items
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
    
    /* For searchbar, but I don't want it
    func updateSearchResults(for searchController: UISearchController) {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        if let searchText = searchController.searchBar.text {
            // Create the query
            let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
            
            // Add query to reqeust
            request.predicate = predicate
            
            // Sort the data (by "title") that back on the db
            // ascending: true -> alphabetical order
            let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
            request.sortDescriptors = [sortDescriptor]
            
            // Do query
            do {
                itemArray = try context.fetch(request)
            } catch {
                print("Error fetching data from context!\n\(error)")
            }
            // Update tableview
            tableView.reloadData()
        }
    }*/
    
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
        
        // Delete current item into db and array
        //context.delete(itemArray[indexPath.row])
        //itemArray.remove(at: indexPath.row)
        
        
        // Update current cell
        //itemArray[indexPath.row].setValue("Completed", forKey: "title")
        
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
                
                // Create a new item and saved it
                let newItem = Item(context: self.context)
                newItem.title = userTask
                newItem.done = false
                newItem.parentCategory = self.selectedCategory
                self.itemArray.append(newItem)
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
        do {
           
           try context.save()
        } catch {
          print("Error saving context!\n\(error)")
        }
        
        // Refresh the table view
        self.tableView.reloadData()
    }
    
    
    // Load items from saved db
    func loadItems() {
        // Create query to filtrer the name list selected
        // Es: Home, Work, Shppong list
        let predicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
        
        // Create a new request with "Item" type
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        
        request.predicate = predicate
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context!\n\(error)")
        }
    }
    
}


