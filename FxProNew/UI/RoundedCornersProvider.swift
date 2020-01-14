//
//  RoundedCornersProvider.swift
//  FxProNew
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class RoundedCornersProvider {
    
    let view: UIView
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return view.layer.cornerRadius
        }
        set {
            view.layer.cornerRadius = newValue
        }
    }
    
    init(with view: UIView, ) {
        view.layer.cornerRadius
    }
    
}
