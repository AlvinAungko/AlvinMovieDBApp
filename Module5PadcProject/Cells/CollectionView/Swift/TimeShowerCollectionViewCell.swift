//
//  TimeShowerCollectionViewCell.swift
//  Module5PadcProject
//
//  Created by Alvin  on 15/02/2022.
//

import UIKit

class TimeShowerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewOfTheTime: UIView!
    
    @IBOutlet weak var timeTitle: UILabel!
    
    var onTabDay:(String)->Void = {_ in}
    var time:dummyTime?
    
    {
        didSet
        {
            if let data = time
            {
                if data.isSelected == true
                {
                    self.viewOfTheTime.backgroundColor = UIColor(named: "primary_color")
                    self.timeTitle.textColor = UIColor.white
                   
                } else
                {
                    self.viewOfTheTime.backgroundColor = UIColor.white
                    self.timeTitle.textColor = UIColor.black
                   
                }
                
                self.timeTitle.text = data.time
                
            }
        }
    }
    
    override func awakeFromNib() {
       
        super.awakeFromNib()
        roundTheView()
        addGesture()
        // Initialization code
    }

}

extension TimeShowerCollectionViewCell
{
    private func roundTheView()
    {
        viewOfTheTime.clipsToBounds = true
        viewOfTheTime.layer.borderWidth = 1
        viewOfTheTime.layer.cornerRadius = 12
    }
}

extension TimeShowerCollectionViewCell
{
    private func addGesture()
    {
        let gestureRecog = UITapGestureRecognizer(target: self, action: #selector(onTabTime))
        viewOfTheTime.addGestureRecognizer(gestureRecog)
        viewOfTheTime.isUserInteractionEnabled = true
    }
    
    @objc func onTabTime()
    {
        onTabDay(time?.time ?? "")
    }
}


