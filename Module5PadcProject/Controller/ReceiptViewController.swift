//
//  ReceiptViewController.swift
//  Module5PadcProject
//
//  Created by Aung Ko Ko on 19/02/2022.
//

import UIKit

class ReceiptViewController: UIViewController {

    @IBOutlet weak var stackedDataView: UIStackView!
    @IBOutlet weak var cinemaMovieIv: UIImageView!
    @IBOutlet weak var viewToCurve: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        roundTheCorners()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTabBack(_ sender: Any) {
       navigateToViewController(identifier: LOGIN_SIGNUP_VIEW_CONTROLLER)
    }
    

}

extension ReceiptViewController
{
    private func roundTheCorners()
    {
        cinemaMovieIv.layer.cornerRadius = 15
        cinemaMovieIv.clipsToBounds = true
        
        viewToCurve.backgroundColor = UIColor.white
        viewToCurve.clipsToBounds = true
        viewToCurve.layer.cornerRadius = 15
        
        viewToCurve.layer.masksToBounds = false
//        viewToCurve.layer.shadowRadius = 30
        viewToCurve.layer.shadowOpacity = 0.14
        viewToCurve.layer.shadowOffset = CGSize(width: 1, height: 3)
        viewToCurve.layer.shadowColor = UIColor.black.cgColor
        
    }
    
    
    
    
}
