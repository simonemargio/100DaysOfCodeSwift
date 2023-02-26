//
//  Item.swift
//  Todoey
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation

// Codabole = Encodable and Decodable
struct Item: Codable {
    var title: String = ""
    var done: Bool = false
}
