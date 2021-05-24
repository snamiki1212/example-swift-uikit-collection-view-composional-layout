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

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.label = UILabel()
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
