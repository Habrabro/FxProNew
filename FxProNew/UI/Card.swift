//
//  Card.swift
//  FxProNew
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class Card: UIView, CornerRadiusCustomizable {
    
    // MARK: Constants
    
    let CORNER_RADIUS: CGFloat = 14
    
    // MARK: Initializers
    
    override init(frame aFrame: CGRect) {
        super.init(frame: aFrame)
        
        commonInit()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        commonInit()
    }
    
    func commonInit() {
        roundCorners(radius: CORNER_RADIUS)
    }
    
}
