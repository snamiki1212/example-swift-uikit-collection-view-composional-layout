//
//  TagCollectionViewCell.swift
//  ExampleCollection
//
//  Created by shunnamiki on 2021/05/24.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    static let cellId = "TAG_CELL_ID"
    var label = UILabel();
    var model: String? {
        didSet {
            label.text = self.model
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
