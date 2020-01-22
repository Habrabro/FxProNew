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
        case tutorial(page: TutorialCoordinator.pages)
        case authorization(page: AuthorizationCoordinator.pages)
        
        var coordinator: Coordinator<UIViewController> {
            switch self {
            case .tutorial(let page):
                let coordinator = TutorialCoordinator(rootViewController: page.viewController)
                return coordinator
            case .authorization(let page):
                let coordinator = AuthorizationCoordinator(rootViewController: page.viewController)
                return coordinator
            }
        }
    }
    
    var section: Section? {
        didSet {
            try? pushChild(coordinator: section!.coordinator) {
                (self.rootViewController as! UINavigationController).navigationBar.isHidden = false
            }
        }
    }
    
    override func start(with completion: @escaping () -> Void = {}) {
        super.start()
        
        section = .tutorial(page: .defaultPage)
        
        guard let rootViewController = self.rootViewController as? UINavigationController else { return }
        rootViewController.navigationBar.isHidden = true
    }
    
    func pushChild(coordinator: Coordinator<UIViewController>, animated: Bool = true, completion: @escaping () -> Void = {}) throws {
        guard let rootViewController = self.rootViewController as? UINavigationController else { throw InvalidRootViewControllerError() }
        let viewController = coordinator.rootViewController
        startChild(coordinator: coordinator) {
            rootViewController.pushViewController(viewController, animated: animated)
            completion()
        }
    }
    
    override func showLogin() {
        section = .authorization(page: .login)
    }
    
    override func showRegistration() {
        section = .authorization(page: .registration)
    }
    
}

class InvalidRootViewControllerError: Error {}
