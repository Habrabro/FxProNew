//
//  TutorialViewController.swift
//  FxProNew
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data: [CollectionViewCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        setupCollectionView()
    }
    
    //MARK: Private methods
    
    private func setupCollectionView() {
        let model = CollectionViewCellModel(title: "Something")
        data = [model]
        let collectionViewDataSource = CollectionViewDataSource()
        collectionView.dataSource = collectionViewDataSource
        collectionViewDataSource.data = data
        
        collectionView.reloadData()
    }
    
}

extension TutorialViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = data[indexPath.row]
        let cell = model.cellForCollectionView(collectionView: collectionView, atIndexPath: indexPath)
        return cell
    }
    
}
