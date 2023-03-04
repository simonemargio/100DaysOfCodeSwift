//
//  Item.swift
//  Todoey
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation
import RealmSwift
// Item and Category files are the same representation of old DataModel.xcdatamodeld
// In this case we use Realm to store data

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    // Create the relationship between Item and Category
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
