//
//  Restaurant.swift
//  ExampleCollection
//
//  Created by shunnamiki on 2021/05/24.
//

import Foundation

struct Restaurant {
    let name: String
    let type: String
    let price: String
    
    
    static func createExampleList() -> [Restaurant] {
        return [
            Restaurant(name: "Nash's dinner", type: "Japanese", price: "$"),
            Restaurant(name: "Red morning", type: "Japanese", price: "$$"),
            Restaurant(name: "Black thunder", type: "india", price: "$$$"),
            Restaurant(name: "Pink pinky", type: "french", price: "$"),
            Restaurant(name: "Silver bullet", type: "USA", price: "$$$"),
            Restaurant(name: "Yellow jeans", type: "Chinese", price: "$$$"),
            Restaurant(name: "Green Food", type: "French", price: "$$$"),
            Restaurant(name: "Cyan cat", type: "French", price: "$$$"),
            Restaurant(name: "Magenta margaret", type: "India", price: "$$$"),
            Restaurant(name: "Transparent stone", type: "India", price: "$$$"),
        ]
    }
}


