//
//  PrimaryButton.swift
//  FxProNew
//
//  Created by admin on 17/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class PrimaryButton: UIButton, CornerRadiusCustomizable {
    
    // MARK: Constants
    
    let CORNER_RADIUS: CGFloat = 23
    
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
