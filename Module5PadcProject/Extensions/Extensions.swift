//
//  Extensions.swift
//  Module5PadcProject
//
//  Created by Alvin  on 15/02/2022.
//

import Foundation
import UIKit

extension UICollectionViewCell
{
    static var identifier:String
    {
        String(describing: self)
    }
}

extension UICollectionView
{
     func registerCustomCells(identifier:String)
    {
        register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
     func bindCustomCellToTheChambers<C:UICollectionViewCell>(identifier:String,indexPath:IndexPath) -> C
    {
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? C else {
            return UICollectionViewCell() as! C
        }
        return cell
    }
}

