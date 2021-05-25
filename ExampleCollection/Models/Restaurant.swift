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
    let type: String
    let price: String
    
    static func createExampleList() -> [Restaurant] {
        return [
            Restaurant(id: UUID().uuidString, name: "Nash's dinner", type: "Japanese", price: "$"),
            Restaurant(id: UUID().uuidString, name: "Red morning", type: "Brazilian", price: "$$"),
            Restaurant(id: UUID().uuidString, name: "Black thunder", type: "India", price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Pink pinky", type: "French", price: "$"),
            Restaurant(id: UUID().uuidString, name: "Silver bullet", type: "Brazilian", price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Yellow jeans", type: "Chainese", price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Green Food", type: "American", price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Cyan cat", type: "French", price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Magenta margaret", type: "India", price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Transparent stone", type: "Chainese", price: "$$$"),
            
            Restaurant(id: UUID().uuidString, name: "Front Frigt", type: "Chainese", price: "$$"),
            Restaurant(id: UUID().uuidString, name: "Back pack", type: "French", price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Right copy", type: "Chainese", price: "$$"),
            Restaurant(id: UUID().uuidString, name: "Top of top", type: "Chainese", price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "Left zone", type: "American", price: "$$"),
            Restaurant(id: UUID().uuidString, name: "Bottom size", type: "French", price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "East Eagle", type: "Japanese", price: "$"),
            Restaurant(id: UUID().uuidString, name: "North Natto", type: "Brazilian", price: "$$"),
            Restaurant(id: UUID().uuidString, name: "South Souse", type: "India", price: "$$$"),
            Restaurant(id: UUID().uuidString, name: "West wow", type: "French", price: "$"),
        ]
    }
}


