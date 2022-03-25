//
//  signUpCollectionViewCell.swift
//  Module5PadcProject
//
//  Created by Alvin  on 17/02/2022.
//

import UIKit

class signUpCollectionViewCell: UICollectionViewCell {
    
    var onTabAction:()->Void = {}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func onTabConfirm(_ sender: Any) {
        onTabAction()
    }
}
