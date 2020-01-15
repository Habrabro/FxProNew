//
//  CollectionViewCell.swift
//  FxProNew
//
//  Created by admin on 15/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, CollectionViewConfigurable {
    
    @IBOutlet var titleLabel: UILabel!
    
    var model: CollectionViewCellModel?
    
    func configureWithModel(_ model: CollectionViewCellModel) {
        self.model = model
    }
    
}
