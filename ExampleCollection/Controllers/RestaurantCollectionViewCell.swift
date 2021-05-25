//
//  RestaurantCollectionViewCell.swift
//  ExampleCollection
//
//  Created by shunnamiki on 2021/05/23.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    static let cellId = "CELL_ID"
    var restaurant: Restaurant? {
        didSet {
            updateUI()
        }
    }
    
    private var stack = UIStackView();
    private var nameLabel = UILabel()
    private var typeLabel = UILabel()
    private var priceLabel = UILabel()
    
    private func updateUI(){
        guard let restaurant = restaurant else { return }
        nameLabel.text = restaurant.name
        typeLabel.text = restaurant.type
        priceLabel.text = restaurant.price
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(stack)
        
        // auto-layout
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
        
        // contents
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(typeLabel)
        stack.addArrangedSubview(priceLabel)
        
        // stlyes
        stack.axis = .vertical
        stack.alignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
