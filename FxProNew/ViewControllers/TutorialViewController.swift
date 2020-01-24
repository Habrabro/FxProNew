//
//  TutorialViewController.swift
//  FxProNew
//
//  Created by admin on 14/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    // MARK: Constants
    
    let IPHONE_6_7_8_SCREEN_HEIGHT: CGFloat = 667
    
    // MARK: Outlets
    
    @IBOutlet weak var tutorialCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewBottomConstraint: NSLayoutConstraint!
    
    // MARK: Public properties
    
    var data: [TutorialCollectionViewCellModel] = [] {
        didSet {}
    }
    
    // MARK: Private properties
    
    private var tutorialCollectionViewController: TutorialCollectionViewController!
    
    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: Actions
    
    
    
    // MARK: Private methods
    
    private func setupConstraints() {
        if UIScreen.main.bounds.height < IPHONE_6_7_8_SCREEN_HEIGHT {
            collectionViewTopConstraint.constant = 15
            collectionViewBottomConstraint.constant = 40
        }
    }
    
    private func setupCollectionView() {
        tutorialCollectionViewController = TutorialCollectionViewController(collectionView: tutorialCollectionView, data: data, pageControl: pageControl)
    }
    
}
