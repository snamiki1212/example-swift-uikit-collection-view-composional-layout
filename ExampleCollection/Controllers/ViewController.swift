//
//  ViewController.swift
//  ExampleCollection
//
//  Created by shunnamiki on 2021/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    weak var restaurantCollectionView: UICollectionView?;
    weak var tagCollectionView: UICollectionView?;
    
    // TODO: Use enum
    let tags = ["Japanese", "French", "Chainese", "Brazilian", "American", "India", ]
    var selectedTags = [String]()

    let restaurants = Restaurant.createExampleList()
    var selectedRestaurantIds = [String]() {
        didSet {
            self.selectedRestaurants = restaurants.filter { selectedRestaurantIds.contains($0.id) }
        }
    }
    var selectedRestaurants = [Restaurant]()
    
    private func generateTagCollectionView() -> UICollectionView {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(1), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize:  itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
        let subitems = [item]
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: subitems)

        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        // layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        // collection-view
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.collectionViewLayout = layout
        cv.isPagingEnabled = true
        
        return cv
    }
    
    private func generateRestaurantCollectionView() -> UICollectionView{
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize:  itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(68))
        let subitems = [item]
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: subitems)

        // section
        let section = NSCollectionLayoutSection(group: group)
        
        // layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        // collection-view
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.collectionViewLayout = layout
        
        return cv
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Restaurants"
        
        
        // MARK: - TAG
        let tagCV = generateTagCollectionView()
        self.tagCollectionView = tagCV
        view.addSubview(tagCV)
        tagCV.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.cellId)
        
        // delegation
        tagCV.delegate = self
        tagCV.dataSource = self
        
        // style
        tagCV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagCV.topAnchor.constraint(equalTo: view.topAnchor),
            tagCV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tagCV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tagCV.heightAnchor.constraint(lessThanOrEqualToConstant: 100)
        ])
        tagCV.backgroundColor = .yellow
        
        // MARK: - restaurantCV
        let restaurantCV = generateRestaurantCollectionView()
        self.restaurantCollectionView = restaurantCV
        view.addSubview(restaurantCV)
        restaurantCV.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: RestaurantCollectionViewCell.cellId)
        
        // delegation
        restaurantCV.delegate = self
        restaurantCV.dataSource = self
        
        // style
        restaurantCV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            restaurantCV.topAnchor.constraint(equalTo: tagCV.bottomAnchor),
            restaurantCV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantCV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            restaurantCV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        restaurantCV.backgroundColor = .red
        
        
        //
        view.layoutIfNeeded()
        print("RENDER__", selectedTags)
    }
}

protocol ViewControllerDelegation {
    func toggle(_ tag: String)
}

extension ViewController: ViewControllerDelegation {
    func toggle(_ tag: String) {
        if let idx = selectedTags.firstIndex(of: tag) {
            selectedTags.remove(at: idx)
        } else {
            selectedTags.append(tag)
        }
        tagCollectionView?.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch collectionView {
        case self.tagCollectionView:
            return 1
        case self.restaurantCollectionView:
            return 1
        default:
            fatalError("Invalid Collection View")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.tagCollectionView:
            guard let cell = tagCollectionView?.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.cellId, for: indexPath) as? TagCollectionViewCell else { fatalError("Invalid Cell happen") }
            
            let item = tags[indexPath.item]
            cell.model = item
            cell._isSelected = selectedTags.contains(item)
            cell.backgroundColor = .systemPink
            cell.delegation = self
            return cell
        case self.restaurantCollectionView:
            guard let cell = restaurantCollectionView?.dequeueReusableCell(withReuseIdentifier: RestaurantCollectionViewCell.cellId, for: indexPath) as? RestaurantCollectionViewCell else { fatalError("Invalid Cell happen") }
            cell.restaurant = restaurants[indexPath.item]
            cell.backgroundColor = .blue
            return cell
        default:
            fatalError("Invalid Collection View")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.tagCollectionView:
            return tags.count
        case self.restaurantCollectionView:
            return restaurants.count
        default:
            fatalError("Invalid Collection View")
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegate{
    //
}
