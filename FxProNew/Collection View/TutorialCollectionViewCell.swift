//
//  TutorialCollectionViewCell.swift
//  FxProNew
//
//  Created by admin on 16/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import CollectionAndTableViewCompatible
import Lottie

class TutorialCollectionViewCell: UICollectionViewCell, Configurable {

    // MARK: Constants
    
    static let DEFAULT_CELL_SIZE = CGSize(width: 150, height: 150)
    
    // MARK: Outlets
    
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: Public properties
    
    var cellSize: CGSize = DEFAULT_CELL_SIZE
    var model: TutorialCollectionViewCellModel?
    
    // MARK: Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Actions
    
    @IBAction func startNowButtonDidTapped(_ sender: Any) {
        showRegistration()
    }
    
    @IBAction func loginButtonDidTapped(_ sender: Any) {
        showLogin()
    }
    
    // MARK: Public methods
    
    func configure(withModel model: TutorialCollectionViewCellModel) {
        self.model = model
        
        animationView.animation = model.animation
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
    
    func setSize(to size: CGSize) {
        cellSize = size
    }

}
