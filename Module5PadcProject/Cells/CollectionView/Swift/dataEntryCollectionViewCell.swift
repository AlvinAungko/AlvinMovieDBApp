//
//  dataEntryCollectionViewCell.swift
//  Module5PadcProject
//
//  Created by Alvin  on 17/02/2022.
//

import UIKit

class dataEntryCollectionViewCell: UICollectionViewCell {
    
    var movieAppProtocol:MovieAppDelegate?

    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roundTheButtons()
    }

    @IBAction func onTabConfirm(_ sender: Any)
    {
        movieAppProtocol?.navigateToMovieList()
    }
}

extension dataEntryCollectionViewCell
{
    private func roundTheButtons()
    {
        googleButton.layer.borderWidth = 0.5
        googleButton.layer.cornerRadius = 15
        
        facebookButton.layer.borderWidth = 0.5
        facebookButton.layer.cornerRadius = 15
    }
}
