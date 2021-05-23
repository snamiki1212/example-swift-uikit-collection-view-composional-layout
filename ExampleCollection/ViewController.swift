//
//  ViewController.swift
//  ExampleCollection
//
//  Created by shunnamiki on 2021/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    weak var photoContainer: UICollectionView?;
    let list = ["a", "b", "c"]
    
    private func generateRestaurantsContainer() -> UICollectionView{
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize:  itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let subitems = [item]
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: subitems)

        // section
        let section = NSCollectionLayoutSection(group: group)
        
        // layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        // container
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        return cv
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Restaurants"
        
        // container
        var container = generateRestaurantsContainer()
        view.addSubview(container)
        container.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: RestaurantCollectionViewCell.cellId)
        photoContainer = container
        
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        container.backgroundColor = .red
        //
        print("RENDER")
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = photoContainer?.dequeueReusableCell(withReuseIdentifier: RestaurantCollectionViewCell.cellId, for: indexPath) as? RestaurantCollectionViewCell else { fatalError("Invalid Cell happen") }
        cell.label.text = list[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
}
