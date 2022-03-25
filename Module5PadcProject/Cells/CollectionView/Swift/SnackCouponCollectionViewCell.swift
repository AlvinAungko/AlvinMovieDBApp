//
//  SnackCouponCollectionViewCell.swift
//  Module5PadcProject
//
//  Created by Aung Ko Ko on 19/02/2022.
//

import UIKit

class SnackCouponCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var priceForEachSnack: UILabel!
    @IBOutlet weak var increaseTheItemButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dropThePriceButton: UIButton!
    
    var numberOfSnack = 0
    
    var onTabPlus:(String)->Void = {_ in}
    var onTabMinus:(String) -> Void = {_ in}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roundTheCorners()
    }

    @IBAction func onTabIncrease(_ sender: Any)
    {
        numberOfSnack += 1
        priceLabel.text = String(numberOfSnack)
        priceForEachSnack.text = "\(String(numberOfSnack*15))"
        
        if numberOfSnack == 1
        {
            onTabPlus(priceForEachSnack.text ?? "")
        }
        else if numberOfSnack > 1
        {
            let valueToPass = (Int(priceForEachSnack.text ?? "") ?? 0)/numberOfSnack
            onTabPlus(String(valueToPass))
            debugPrint(valueToPass)
        } else
        {
            debugPrint("")
        }
        
        
    }
    @IBAction func onTapDecrease(_ sender: Any)
    {
        if numberOfSnack > 1
        {
            numberOfSnack -= 1
            priceLabel.text = String(numberOfSnack)
            priceForEachSnack.text = String(numberOfSnack * 15)
            
            let valueToPass = (Int(priceForEachSnack.text ?? "") ?? 0)/numberOfSnack
            onTabMinus(String(valueToPass))
            
           
        } else if numberOfSnack == 1
        {
            numberOfSnack -= 1
            priceForEachSnack.text = String(numberOfSnack * 15)
            onTabMinus(String(15))
        }
        else
        {
            debugPrint("")
        }
    }
}

extension SnackCouponCollectionViewCell
{
    private func roundTheCorners()
    {
        priceLabel.clipsToBounds = true
        priceLabel.layer.borderWidth = 0.4
       
   
        dropThePriceButton.clipsToBounds = true
        dropThePriceButton.layer.borderWidth = 0.4
        dropThePriceButton.layer.cornerRadius = 6.5
        dropThePriceButton.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        
        increaseTheItemButton.clipsToBounds = true
        increaseTheItemButton.layer.borderWidth = 0.4
        increaseTheItemButton.layer.cornerRadius = 6.5
        increaseTheItemButton.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
        
    }
}
