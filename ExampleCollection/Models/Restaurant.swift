//
//  Restaurant.swift
//  ExampleCollection
//
//  Created by shunnamiki on 2021/05/24.
//

import Foundation

func uuid() -> String{
    return UUID().uuidString
}

struct Restaurant {
    let id: String
    let name: String
    let type: Tag
    let price: Price
    
    static func createExampleList() -> [Restaurant] {
        return [
            Restaurant(id: uuid(), name: "Nash's dinner", type: .Japanese, price: .low),
            Restaurant(id: uuid(), name: "Red morning", type: .Brazilian, price: .middle),
            Restaurant(id: uuid(), name: "Black thunder", type: .India, price: .high),
            Restaurant(id: uuid(), name: "Pink pinky", type: .French, price: .low),
            Restaurant(id: uuid(), name: "Silver bullet", type: .Brazilian, price: .high),
            Restaurant(id: uuid(), name: "Yellow jeans", type: .Chinese, price: .high),
            Restaurant(id: uuid(), name: "Green Food", type: .American, price: .high),
            Restaurant(id: uuid(), name: "Cyan cat", type: .French, price: .high),
            Restaurant(id: uuid(), name: "Magenta margaret", type: .India, price: .high),
            Restaurant(id: uuid(), name: "Transparent stone", type: .Chinese, price: .high),
            
            Restaurant(id: uuid(), name: "Front Frigt", type: .Chinese, price: .middle),
            Restaurant(id: uuid(), name: "Back pack", type: .French, price: .high),
            Restaurant(id: uuid(), name: "Right copy", type: .Chinese, price: .middle),
            Restaurant(id: uuid(), name: "Top of top", type: .Chinese, price: .high),
            Restaurant(id: uuid(), name: "Left zone", type: .American, price: .middle),
            Restaurant(id: uuid(), name: "Bottom size", type: .French, price: .high),
            Restaurant(id: uuid(), name: "East Eagle", type: .Japanese, price: .low),
            Restaurant(id: uuid(), name: "North Natto", type: .Brazilian, price: .middle),
            Restaurant(id: uuid(), name: "South Souse", type: .India, price: .high),
            Restaurant(id: uuid(), name: "West wow", type: .French, price: .low),
        ]
    }
}


