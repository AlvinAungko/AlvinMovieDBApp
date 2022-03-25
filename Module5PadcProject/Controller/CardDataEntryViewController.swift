//
//  CardDataEntryViewController.swift
//  Module5PadcProject
//
//  Created by Aung Ko Ko on 26/02/2022.
//

import UIKit

class CardDataEntryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTabConfirm(_ sender: Any) {
        navigateToViewController(identifier: MOVIE_VISA_VIEW_CONTROLLER)
    }
    
}
