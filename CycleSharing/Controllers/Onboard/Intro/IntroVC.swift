//
//  IntroVC.swift
//  GPSTracker
//
//  Created by Tinh Vu on 4/4/23.
//  Copyright © 2023 Tinh Vu. All rights reserved.
//

import UIKit
import SCPageControl

class IntroVC: BaseVC {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    private let images: [String] = ["intro1", "intro2", "intro3"]
    
    private var page: Int = 0
    
    let indicatorView = SCPageControlView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

        collectionView.register(UINib(nibName: IntroCell.className, bundle: nil), forCellWithReuseIdentifier: IntroCell.className)
        collectionView.isPagingEnabled = true
        
        indicatorView.frame = CGRect(x: 0, y: Int(view.bounds.height) - 150, width: Int(UIScreen.main.bounds.size.width), height: 30)
        indicatorView.scp_style = .SCNormal
        view.addSubview(indicatorView)
    }
    
    private func updateViews() {
        
        
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        if page < 2 {
            page += 1
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: IndexPath(row: page, section: 0), at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
        } else {
            UserDefaults.standard.set(true, forKey: Constant.firstimeIntro)
        }
    }
    
}

extension IntroVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        indicatorView.scroll_did(scrollView)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let newPage = Int(round(scrollView.contentOffset.x / collectionView.frame.width))
        if (newPage != page) {
            page = newPage
            updateViews()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroCell.className, for: indexPath) as? IntroCell else {
            return UICollectionViewCell()
        }
        cell.updateImage(images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
