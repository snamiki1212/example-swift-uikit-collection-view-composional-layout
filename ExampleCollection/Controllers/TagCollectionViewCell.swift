//
//  TagCollectionViewCell.swift
//  ExampleCollection
//
//  Created by shunnamiki on 2021/05/24.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    static let cellId = "TAG_CELL_ID"
    var button = UIButton();
    var model: String? {
        didSet {
            button.setTitle(self.model, for: .normal) 
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
