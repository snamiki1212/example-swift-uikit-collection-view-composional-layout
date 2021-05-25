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
    var restaurant: Restaurant? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI(){
        label.text = restaurant?.name
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layoutIfNeeded()
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
