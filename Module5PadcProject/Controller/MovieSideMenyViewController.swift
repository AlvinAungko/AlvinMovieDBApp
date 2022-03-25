//
//  MovieSideMenyViewController.swift
//  Module5PadcProject
//
//  Created by Aung Ko Ko on 14/02/2022.
//

import UIKit

class MovieSideMenyViewController: UIViewController {

    @IBOutlet weak var logOutStackView: UIStackView!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        circleTheImage()
        addGesture()
        // Do any additional setup after loading the view.
    }
    
}



extension MovieSideMenyViewController
{
    private func circleTheImage()
    {
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = 35
    }
    
    private func addGesture()
    {
        let gestureRecog = UITapGestureRecognizer(target: self, action: #selector(onTabLogOut))
        logOutStackView.addGestureRecognizer(gestureRecog)
        logOutStackView.isUserInteractionEnabled = true
    }
    
    @objc func onTabLogOut()
    {
        navigateToViewController(identifier: LOGIN_SIGNUP_VIEW_CONTROLLER)
    }
}
