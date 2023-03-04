//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit
import RealmSwift
//import ChameleonFramework


class CategoryViewController: SwipeTableTableViewController {
    
    // Create a list of item class
    // Results is an auto-updating container type in Realm returned from object queries
    var categories: Results<Category>!
    
    // A Realm instanc that represents a Realm db
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Use Realm to load all categories
        loadCategories()
        tableView.rowHeight = 80.0
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // If categories?.count has a value, return it; otherwise return 1
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // The class SwipeTableTableViewController create the cell
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        //  if let category = categories?[indexPath.row] 
        if (categories?[indexPath.row]) != nil {
            // Add category name
            cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories added yet"
            
            // Enable for add color
            // cell.backgroundColor = UIColor(hexString: categories?[indexPath.row].colour ?? "FFFFFF")
    
        }
       
        return cell
    }
    
    // When user selects one cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Prepare to next view
        let destinationVC = segue.destination as! TodoListViewController
        
        // Take the category that correponds to selected cell
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category!\n\(error)")
        }
        tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            // When user clicks on Add
            let newCategory = Category()
            newCategory.name = textField.text!
           // newCategory.colour = UIColor.randomFlat().hexValue()
            
            self.save(category: newCategory)
        }
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func loadCategories() {
        categories = realm.objects(Category.self)
        tableView.reloadData()
    }
    
    // Delete data from swipe
    override func updateModel(at indexPath: IndexPath) {
        
        if let categoryForDeletion = self.categories?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error deleting category!\n\(error)")
            }
        }
    }

}

