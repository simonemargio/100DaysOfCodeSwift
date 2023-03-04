//
//  Data.swift
//  Todoey
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation
import RealmSwift


// This is only an example to try Realm

// More code into AppDelegate
// Object is a class used to define Realm model obj
class Data: Object {
    // With dynamic set, the app monitor every var change
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var favoriteNumber: Int = 0
}
