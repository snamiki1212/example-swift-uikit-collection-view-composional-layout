//
//  RestaurantCollectionViewCell.swift
//  ExampleCollection
//
//  Created by shunnamiki on 2021/05/23.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    static let cellId = "CELL_ID"
    var label = UILabel();

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.label = UILabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
