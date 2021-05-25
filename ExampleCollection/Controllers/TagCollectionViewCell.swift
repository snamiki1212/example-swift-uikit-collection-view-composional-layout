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
    var _isSelected: Bool = false {
        didSet {
            button.titleLabel?.backgroundColor = _isSelected ? .blue : .systemPink
        }
    }
    var delegation: ViewControllerDelegation?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor),
        ])
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TagCollectionViewCell{
    @objc func onClick(){
        guard let delegation = delegation, let model = model else { fatalError("Invalid error on Click")}
        delegation.toggle(model)
    }
}
