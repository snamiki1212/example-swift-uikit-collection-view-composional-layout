//
//  Restaurant.swift
//  ExampleCollection
//
//  Created by shunnamiki on 2021/05/24.
//

import Foundation

struct Restaurant {
    let id: String
    let name: String
    let type: Tag
    let price: String
    
    static func createExampleList() -> [Restaurant] {
        return [
            Restaurant(id: UUID().uuidString, name: "Nash's dinner", type: Tag.Japanese, price: "$"),
            Restaurant(id: UUID().uuidString, name: "Red morning", type: Tag.Brazilian, price: "$$"),
            Restaurant(id: UUID().uuidString, name: "Black thunder", type: Tag.India, price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Pink pinky", type: Tag.French, price: "$"),
            Restaurant(id: UUID().uuidString, name: "Silver bullet", type: Tag.Brazilian, price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Yellow jeans", type: Tag.Chainese, price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Green Food", type: Tag.American, price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Cyan cat", type: Tag.French, price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Magenta margaret", type: Tag.India, price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Transparent stone", type: Tag.Chainese, price: "$$$"),
            
            Restaurant(id: UUID().uuidString, name: "Front Frigt", type: Tag.Chainese, price: "$$"),
            Restaurant(id: UUID().uuidString, name: "Back pack", type: Tag.French, price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Right copy", type: Tag.Chainese, price: "$$"),
            Restaurant(id: UUID().uuidString, name: "Top of top", type: Tag.Chainese, price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Left zone", type: Tag.American, price: "$$"),
            Restaurant(id: UUID().uuidString, name: "Bottom size", type: Tag.French, price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "East Eagle", type: Tag.Japanese, price: "$"),
            Restaurant(id: UUID().uuidString, name: "North Natto", type: Tag.Brazilian, price: "$$"),
            Restaurant(id: UUID().uuidString, name: "South Souse", type: Tag.India, price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "West wow", type: Tag.French, price: "$"),
        ]
    }
}


