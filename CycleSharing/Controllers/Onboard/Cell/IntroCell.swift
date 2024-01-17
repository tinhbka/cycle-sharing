//
//  IntroCell.swift
//  GPSTracker
//
//  Created by Tinh Vu on 4/29/23.
//  Copyright © 2023 Tinh Vu. All rights reserved.
//

import UIKit

class IntroCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTop: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateImage(_ named: String) {
        imageView.image = UIImage(named: named)
    }
    
}
