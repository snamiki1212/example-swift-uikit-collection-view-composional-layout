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
    
    let tags = Tag.allCases
    let restaurants = Restaurant.createExampleList()
    var selectedTags = [Tag]() {
        didSet {
            filteredRestaurants = selectedTags.isEmpty
                ? restaurants
                : restaurants.filter({ selectedTags.contains($0.type)  })

            restaurantCollectionView?.reloadData()
        }
    }
    var filteredRestaurants = [Restaurant]()
    
    private func generateTagCollectionView() -> UICollectionView {
        let spacing = CGFloat(10)
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(1), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize:  itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
        let subitems = [item]
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: subitems)
        group.interItemSpacing = .fixed(spacing)

        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        // layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        // collection-view
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.collectionViewLayout = layout
        cv.isPagingEnabled = true
        cv.backgroundColor = UIColor(red: 0, green: 50/255, blue: 50/255, alpha: 1)
        
        return cv
    }
    
    private func generateRestaurantCollectionView() -> UICollectionView{
        let spacing = CGFloat(10)

        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize:  itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(68))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(spacing)

        // section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: 0, trailing: spacing)
        
        // layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        // collection-view
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.collectionViewLayout = layout
        cv.backgroundColor = .white
        
        return cv
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Restaurants"
        filteredRestaurants = restaurants
        
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
    }
}

extension ViewController: TagCollectionViewCellDelegation {
    func toggle(_ tag: Tag) {
        // update model data
        if let idx = selectedTags.firstIndex(of: tag) {
            selectedTags.remove(at: idx)
        } else {
            selectedTags.append(tag)
        }
        
        // update view data
        let index = tags.firstIndex(of: tag)!
        let indexPath = IndexPath(item: index, section: 0)
        tagCollectionView?.reloadItems(at: [indexPath])
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
            cell.delegation = self
            return cell
        case self.restaurantCollectionView:
            guard let cell = restaurantCollectionView?.dequeueReusableCell(withReuseIdentifier: RestaurantCollectionViewCell.cellId, for: indexPath) as? RestaurantCollectionViewCell else { fatalError("Invalid Cell happen") }
            cell.restaurant = filteredRestaurants[indexPath.item]
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
            return filteredRestaurants.count
        default:
            fatalError("Invalid Collection View")
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegate{
    //
}
