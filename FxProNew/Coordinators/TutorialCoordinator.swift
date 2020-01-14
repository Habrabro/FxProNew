//
//  TutorialCoordinator.swift
//  FxProNew
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class TutorialCoordinator: Coordinator<UIViewController> {
    
    override func start(with completion: @escaping () -> Void = {}) {
        super.start()
        
        completion()
    }
    
}
