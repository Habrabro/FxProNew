//
//  CollectionViewDataSource.swift
//  FxProNew
//
//  Created by admin on 15/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import CollectionAndTableViewCompatible

class TutorialCollectionViewController: NSObject, UICollectionViewDataSource {
    
    // MARK: Public properties
    
    var data: [CollectionViewCompatible]
    var collectionView: UICollectionView?
    var pageControl: UIPageControl?
    
    var currentPage = 0 {
        didSet {
            if oldValue != currentPage {
                pageDidChanged(from: oldValue, to: currentPage)
            }
        }
    }
    
    // MARK: Init
    
    init(collectionView: UICollectionView? = nil,
         data: [CollectionViewCompatible] = [],
         pageControl: UIPageControl? = nil) {
        self.collectionView = collectionView
        self.data = data
        self.pageControl = pageControl
        
        super.init()
        
        setupCollectionView()
    }
    
    // MARK: UICollectionViewDataSource methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueCell(byIndexPath: indexPath)
        return cell
    }
    
    // MARK: Private methods
    
    private func dequeueCell(byIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        let model = data[indexPath.row]
        let cell = model.cellForCollectionView(collectionView: collectionView!, atIndexPath: indexPath)
        return cell
    }
    
    private func setupCollectionView() {
        guard let collectionView = self.collectionView else { return }
        collectionView.delegate = self
        collectionView.dataSource = self
        
        guard let first = data.first else { return }
        let cellNibName = first.reuseIdentifier
        collectionView.register(UINib(nibName: cellNibName, bundle: nil), forCellWithReuseIdentifier: cellNibName)
        
        guard let pageControl = self.pageControl else { return }
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = data.count
        
        collectionView.reloadData() {
            self.didLoad()
        }
    }
    
    private func pageDidChanged(from previousPage: Int, to currentPage: Int) {
        if let collectionView = self.collectionView {
            let indexPath = IndexPath(row: currentPage, section: 0)
            let cell = collectionView.cellForItem(at: indexPath) as! TutorialCollectionViewCell
            if cell.animationView.isAnimationPlaying {
                cell.animationView.stop()
            }
            cell.animationView.play()
        }
    }
    
    private func didLoad() {
        guard let collectionView = self.collectionView else { return }
        let cell = collectionView.cellForItem(at: IndexPath(row: 0, section: 0)) as! TutorialCollectionViewCell
        cell.animationView.play()
    }
    
}

extension TutorialCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionViewDelegateFlowLayout methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = dequeueCell(byIndexPath: indexPath) as! TutorialCollectionViewCell
        return cell.cellSize
    }
    
}

extension TutorialCollectionViewController: UIScrollViewDelegate {
    
    // MARK: UIScrollViewDelegate methods
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x / w))
        self.currentPage = currentPage
        
        if let pageControl = self.pageControl {
            pageControl.currentPage = currentPage
        }
    }
}
