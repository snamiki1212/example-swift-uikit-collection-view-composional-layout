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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(10))
        let item = NSCollectionLayoutItem(layoutSize:  itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(12))
        let subitems = [item]
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: subitems)

        // section
        let section = NSCollectionLayoutSection(group: group)
        
        // layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        // container
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.collectionViewLayout = layout
        
        return cv
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Restaurants"
        
        // container
        let container = generateRestaurantsContainer()
        photoContainer = container
        view.addSubview(container)
        container.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: RestaurantCollectionViewCell.cellId)
        
        // delegation
        container.delegate = self
        container.dataSource = self
        
        // style
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        container.backgroundColor = .red
        
        view.layoutIfNeeded()
        
        //
        print("RENDER")
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("RENDER CELL. No", indexPath.item)
        guard let cell = photoContainer?.dequeueReusableCell(withReuseIdentifier: RestaurantCollectionViewCell.cellId, for: indexPath) as? RestaurantCollectionViewCell else { fatalError("Invalid Cell happen") }
        
        cell.label.text = list[indexPath.item]
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("ITEM NUMBER", list.count)
        return list.count
    }
    
    
}

extension ViewController: UICollectionViewDelegate{
    //
}
