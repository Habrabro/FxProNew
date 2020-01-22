//
//  CollectionViewItemModel.swift
//  FxProNew
//
//  Created by admin on 15/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import CollectionAndTableViewCompatible
import Lottie

class TutorialCollectionViewCellModel: CollectionViewCompatible {
    
    // MARK: Public properties
    
    var selected: Bool = false
    
    var reuseIdentifier: String {
        return "TutorialCollectionViewCell"
    }
    
    var animation: Animation?
    var title: String
    var description: String
    
    // MARK: Init
    
    init(animation: Animation?, title: String, description: String) {
        self.animation = animation
        self.title = title
        self.description = description
    }
    
    // MARK: Public methods
    
    func cellForCollectionView(collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TutorialCollectionViewCell
        cell.configure(withModel: self)
        cell.setSize(to: collectionView.frame.size)
        
        return cell
    }
    
}
