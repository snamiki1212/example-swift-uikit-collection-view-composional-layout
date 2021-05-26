//
//  TagCollectionViewCell.swift
//  ExampleCollection
//
//  Created by shunnamiki on 2021/05/24.
//

import UIKit

let TRANSPARENT = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
let TRANSPARENT_GRAY = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 0.3)

class TagCollectionViewCell: UICollectionViewCell {
    static let cellId = "TAG_CELL_ID"
    var model: Tag? {
        didSet {
            button.setTitle(self.model?.rawValue, for: .normal) 
        }
    }
    var _isSelected: Bool = false {
        didSet {
            button.titleLabel?.backgroundColor = _isSelected ? TRANSPARENT_GRAY : TRANSPARENT
        }
    }
    var delegation: TagCollectionViewCellDelegation?
    private var button = UIButton();

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
