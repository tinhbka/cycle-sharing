//
//  LanguageCell.swift
//  GPSTracker
//
//  Created by Tinh Vu on 4/5/23.
//  Copyright © 2023 Tinh Vu. All rights reserved.
//

import UIKit

class LanguageCell: UITableViewCell {

    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    private var type: LanguageType?
    
    var selectHandler: ((LanguageType?) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func fill(_ type: LanguageType, selected: Bool) {
        self.type = type
        flagLabel.text = type.name
        flagImageView.image = type.flagIcon.callAsFunction()
        checkImageView.image = UIImage(named: selected ? "ic_lang_checked" : "ic_lang_check")
    }
    
    @IBAction func selectTapped(_ sender: Any) {
        selectHandler?(type)
    }
    
}
