//
//  Category.swift
//  Todoey
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation
import RealmSwift

// Item and Category files are the same representation of old DataModel.xcdatamodeld
// In this case we use Realm to store data

class Category: Object {
    @objc dynamic var name: String = ""
    // List of item represents what was the relationship between the two classes Item and Data
    let items = List<Item>()
}
