//
//  CollectionViewItemModel.swift
//  FxProNew
//
//  Created by admin on 15/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class CollectionViewCellModel: CollectionViewCompatible {
    
    var reuseIdentifier: String {
        return "CollectionViewCell"
    }
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func cellForCollectionView(collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.configureWithModel(self)
        return cell
    }
    
}
