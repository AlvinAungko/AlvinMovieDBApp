//
//  LoginAndSignUpViewController.swift
//  Module5PadcProject
//
//  Created by Alvin  on 17/02/2022.
//

import UIKit

class LoginAndSignUpViewController: UIViewController
{
    @IBOutlet weak var signUpStackView: UIStackView!
    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var viewOfLogin: UIView!
    @IBOutlet weak var viewOfSignUp: UIView!
    @IBOutlet weak var heightOfDataEntryCollectionView: NSLayoutConstraint!
    @IBOutlet weak var heightOfIndicatorCollectionView: NSLayoutConstraint!
    @IBOutlet weak var dataEntryCollectionView: UICollectionView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initView()
        setUpHeightForCollectionView()
        registerCells()
        setDataSourceAndDelegate()
        addGesture()

        // Do any additional setup after loading the view.
    }
    

}

extension LoginAndSignUpViewController
{
    private func addGesture()
    {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTabLogin))
        loginStackView.addGestureRecognizer(gestureRecognizer)
        loginStackView.isUserInteractionEnabled = true
        
        
        let gestureRecognizerForSignUp = UITapGestureRecognizer(target: self, action: #selector(onTabSignUp))
        signUpStackView.addGestureRecognizer(gestureRecognizerForSignUp)
        signUpStackView.isUserInteractionEnabled = true
        
    }
    
    @objc func onTabLogin()
    {
        presentRespectiveCell(to: 0)
        
    }
    
    @objc func onTabSignUp()
    {
        presentRespectiveCell(to: 1)
        
    }
}



extension LoginAndSignUpViewController
{
    private func setDataSourceAndDelegate()
    {
        dataEntryCollectionView.dataSource = self
        dataEntryCollectionView.delegate = self
    }
    
    private func registerCells()
    {
       
        dataEntryCollectionView.registerCustomCells(identifier: dataEntryCollectionViewCell.identifier)
        dataEntryCollectionView.registerCustomCells(identifier: signUpCollectionViewCell.identifier)
    }
}

extension LoginAndSignUpViewController
{
    private func setUpHeightForCollectionView()
    {
        
        heightOfDataEntryCollectionView.constant = 498
        self.dataEntryCollectionView.layoutIfNeeded()
    }
    
    private func initView()
    {
        self.viewOfLogin.isHidden = false
        self.viewOfSignUp.isHidden = true
    }
}


extension LoginAndSignUpViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
            return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            switch indexPath.section
            {
            case 0:
                let cell = dataEntryCollectionView.bindCustomCellToTheChambers(identifier: dataEntryCollectionViewCell.identifier, indexPath: indexPath) as dataEntryCollectionViewCell
                cell.movieAppProtocol = self
                return cell
            case 1:
                let cell = dataEntryCollectionView.bindCustomCellToTheChambers(identifier: signUpCollectionViewCell.identifier, indexPath: indexPath) as signUpCollectionViewCell
                cell.onTabAction =
                {
                    self.navigateToViewController(identifier: MOVIE_VIEW_CONTROLLER)
                }
                return cell
            default : return UICollectionViewCell()
            }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            switch indexPath.section
            {
            case 0: return CGSize(width: dataEntryCollectionView.bounds.width, height: heightOfDataEntryCollectionView.constant)
            case 1: return CGSize(width: dataEntryCollectionView.bounds.width, height:  heightOfDataEntryCollectionView.constant-5)
            default : return CGSize(width: 0, height: 0)
            }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x/scrollView.frame.width == 0
        {
            self.viewOfLogin.isHidden = false
            self.viewOfSignUp.isHidden = true
        } else
        {
            self.viewOfLogin.isHidden = true
            self.viewOfSignUp.isHidden = false
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x/scrollView.frame.width == 0
        {
            self.viewOfLogin.isHidden = false
            self.viewOfSignUp.isHidden = true
        } else
        {
            self.viewOfLogin.isHidden = true
            self.viewOfSignUp.isHidden = false
        }
    }
    
    func presentRespectiveCell(to whichCell:Int)
    {
        if whichCell == 1
        {
            let cellSize = CGSize(width: self.dataEntryCollectionView.frame.width, height: self.dataEntryCollectionView.frame.height)
            
            let contentOffSet = dataEntryCollectionView.contentOffset
            
            dataEntryCollectionView.scrollRectToVisible(CGRect(x: CGFloat(contentOffSet.x) +  CGFloat(cellSize.width), y: CGFloat(contentOffSet.y), width: cellSize.width, height: cellSize.height), animated: true)
            debugPrint(contentOffSet.x)
        } else
        {
            let cellSize = CGSize(width: self.dataEntryCollectionView.frame.width, height: self.dataEntryCollectionView.frame.height)
            
            let contentOffSet = dataEntryCollectionView.contentOffset
            
            dataEntryCollectionView.scrollRectToVisible(CGRect(x: CGFloat(contentOffSet.x) -  CGFloat(cellSize.width), y: CGFloat(contentOffSet.y), width: cellSize.width, height: cellSize.height), animated: true)
            debugPrint(contentOffSet.x)
        }
        
        
    }
    
}

extension LoginAndSignUpViewController:MovieAppDelegate
{
    func navigateToMovieList()
    {
        navigateToViewController(identifier: MOVIE_VIEW_CONTROLLER)
    }
    
    
}
