//
//  Tag.swift
//  ExampleCollection
//
//  Created by shunnamiki on 2021/05/25.
//

import Foundation

enum Tag: String {
    case Japanese
    case French
    case Chainese
    case Brazilian
    case American
    case India
    
    static func createAll() -> [Tag] {
        return [.Japanese, .French, .Chainese, .Brazilian, .American, .India]
    }
    
}
