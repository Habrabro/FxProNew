//
//  DataManager.swift
//  FxProNew
//
//  Created by admin on 20/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import Lottie

class TutorialDataProvider {
    
    // MARK: Hardcoded data
    
    var data: [TutorialCollectionViewCellModel] = [
        TutorialCollectionViewCellModel(
            animation: Animation.named("FxPro_Logo"),
            title: "Welcome to FxPro!",
            description: "There is a reason why over 870,000 trading accounts have been opened with us."
        ),
        TutorialCollectionViewCellModel(
            animation: Animation.named("Phone"),
            title: "Trade differently",
            description: "FxPro offers you all popular trade markets: Forex, Futures, Indices, Shares, Metals, Energies"
        ),
        TutorialCollectionViewCellModel(
            animation: Animation.named("Shield"),
            title: "Complete Security",
            description: "FxPro protects all clients data and offers high level of security"
        ),
        TutorialCollectionViewCellModel(
            animation: Animation.named("Analyse"),
            title: "Truly Exclusive",
            description: "FxPro analytics team provide you daily market insights"
        ),
        TutorialCollectionViewCellModel(
            animation: Animation.named("Support"),
            title: "Multilingual Support",
            description: "FxPro offers you customer support in 20+ languages via all popular messengers, email, calls."
        ),
    ]
    
    // MARK: Static properties
    
    static var shared: TutorialDataProvider = {
        let instance = TutorialDataProvider()
        return instance
    }()
    
    // MARK: Public methods
    
    func provideTutorialData() -> [TutorialCollectionViewCellModel] {
        return data
    }
    
}

extension TutorialDataProvider: NSCopying {

    // MARK: Method implementation for shared state
    
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
