//
//  UIResponder+Extensions.swift
//  FxProNew
//
//  Created by admin on 22/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension UIResponder {
    
    @objc dynamic func showLogin() {
        coordinatingResponder?.showLogin()
    }
    
    @objc dynamic func showRegistration() {
        coordinatingResponder?.showRegistration()
    }
    
}
