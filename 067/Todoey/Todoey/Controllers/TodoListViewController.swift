//
//  ViewController.swift
//  Todoey
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit
import CoreData
import RealmSwift
//import ChameleonFramework

class TodoListViewController: SwipeTableTableViewController {
    
    // Create a list of item class
    // Results is an auto-updating container type in Realm returned from object queries
    var todoItems: Results<Item>?
    
    // A Realm instanc that represents a Realm db
    let realm = try! Realm()
    
    // Type of list category
    // Es: Home, Work, Shppong list
    var selectedCategory: Category? {
        // Call this when selectedCategory has a value
        didSet {
            // Load list's elements
            loadItems()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navbar title as selected category
        if let categoryName = selectedCategory?.name {
            self.title = categoryName
        }
    }
    
    
    // We see these funcations in Day 50 with Flash chat app
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // The cells are reused, so when the user scrolls down some cells are "hidden" (depending on the size of the screen I can have a number of cells visible,
        // but if I have many elements I have to scroll the list). These cells are reused to show all other items when scrolling through the list.
        // It is therefore necessary to check if each element has the .check enabled or not.
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = todoItems?[indexPath.row] {
            // Set the title of cell and checkmark
            cell.textLabel?.text = item.title
        
            
         /* Enable for color gradient cells
            if let colour = UIColor(hexString: selectedCategory!.colour)?.darken(byPercentage:CGFloat(indexPath.row) / CGFloat(todoItems!.count)) {
                cell.backgroundColor = colour
                cell.textLabel?.textColor = ContrastColorOf(colour, returnFlat: true)
            }
          */
            
            
            cell.accessoryType = item.done == true ? .checkmark: .none
        } else {
            cell.textLabel?.text = "No Items Added"
        }
        
        return cell
    }
    
    // Delegate function when user click on an item to mark it
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Access to the item
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    // Set flag check done/undone
                    item.done = !item.done
                }
            } catch {
                print("Error saving done status!\n\(error)")
            }
        }
        
        tableView.reloadData()
        
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
            if let currentCategory = self.selectedCategory {
              
                do {
                    // Write user's task into db
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = textField.text!
                        currentCategory.items.append(newItem)
                    }
                } catch {
                    print("Error saving new items!\n\(error)")
                }
            }
            self.tableView.reloadData()
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
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // Load items from saved db
    func loadItems() {
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        tableView.reloadData()
        
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let item = todoItems?[indexPath.row] {
            do{
                try realm.write {
                    realm.delete(item)
                }
            } catch {
                print("Error deleting item!\n\(error)")
            }
        }
    }
    
}
