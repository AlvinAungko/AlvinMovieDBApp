//
//  DayCollectionViewCell.swift
//  Module5PadcProject
//
//  Created by Alvin  on 15/02/2022.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var dayCalender:DummyDay?
    {
        didSet{
            if let _ = dayCalender
            {
                debugPrint("")
            }
        }
    }
    var onTabDayDate:(String)->Void = {_ in}
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addGesture()
    }

}

extension DayCollectionViewCell
{
    func bindDataToTheCell(dayVOS:DummyDay)
    {
        if dayVOS.isSelected == true
        {
            dayLabel.textColor = UIColor.white
            dateLabel.textColor = UIColor.white
        } else
        {
            dayLabel.textColor = UIColor(named: color_reserved)
            dateLabel.textColor = UIColor(named: color_reserved)
        }
        
        dayLabel.text = dayVOS.day
        dateLabel.text = dayVOS.date
    }
}

extension DayCollectionViewCell
{
    private func addGesture()
    {
        let gestureRecog = UITapGestureRecognizer(target: self, action: #selector(onTabDate))
        dayLabel.isUserInteractionEnabled = true
        dayLabel.addGestureRecognizer(gestureRecog)
    }
    
    @objc func onTabDate()
    {
        onTabDayDate(dayCalender?.date ?? "")
    }
}
