//
//  SwipeTableTableViewController.swift
//  Todoey
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit
import SwipeCellKit

class SwipeTableTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
      
    }
    
    // Table view datasource functions
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        
        return cell
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        // Orentation of the swipe
        guard orientation == .right else { return nil }
        
        // What happened when swipe
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // Handle action by updating model with deletion
            self.updateModel(at: indexPath)
        
        }

        // Customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")

        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        return options
    }

    func updateModel(at indexPath: IndexPath) {
        // Update data model
    }
    
}

