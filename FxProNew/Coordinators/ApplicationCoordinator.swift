//
//  ApplicationCoordinator.swift
//  FxProNew
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator<UIViewController> {
    
    enum Section {
        case tutorial(coordinator: TutorialCoordinator)
    }
    
//    var section: Section = .tutorial
    
    override func start(with completion: @escaping () -> Void = {}) {
        super.start()
        
        let tutorialStoryboard = UIStoryboard(name: "Tutorial", bundle: nil)
        let tutorialViewController = tutorialStoryboard.instantiateViewController(withIdentifier: "TutorialViewController")
        let tutorialCoordinator = TutorialCoordinator(rootViewController: tutorialViewController)
        
        startChild(coordinator: tutorialCoordinator) {
            guard let rootVC = self.rootViewController as? UINavigationController else { return }
            rootVC.pushViewController(tutorialViewController, animated: false)
        }
    }
    
}
