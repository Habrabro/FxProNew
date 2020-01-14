//
//  AppDependency.swift
//  FxProNew
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct AppDependency {
    
    var sliderManager: SliderManager?
    
    //MARK: Init
    
    init(sliderManager: SliderManager? = nil) {
        self.sliderManager = sliderManager
    }
    
}
