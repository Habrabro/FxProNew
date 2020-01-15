//
//  CollectionViewConfigurable.swift
//  FxProNew
//
//  Created by admin on 15/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol CollectionViewConfigurable {
    
    associatedtype T
    var model: T? { get set }
    func configureWithModel(_: T)
    
}
