//
//  VisaCardPaymentViewController.swift
//  Module5PadcProject
//
//  Created by Aung Ko Ko on 19/02/2022.
//

import UIKit
import Gemini

class VisaCardPaymentViewController: UIViewController {
    @IBOutlet weak var heightOfCardPaymentCollectionView: NSLayoutConstraint!
 
    @IBOutlet weak var cardVisaCardCollectionView: GeminiCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeightForCollectionView()
        configureAnimation()
        registerCells()
        setDataSourceAndDelegate()
        // Do any additional setup after loading the view.
    }
    @IBAction func onTabaddANewCard(_ sender: Any) {
        navigateToViewController(identifier: "CardDataEntryViewController")
    }
    
    @IBAction func onTabConfirm(_ sender: Any)
    {
        navigateToViewController(identifier: MOVIE_RECEIPT_VIEW_CONTROLLER)
    }
    
    @IBAction func onTabBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension VisaCardPaymentViewController
{
    private func setDataSourceAndDelegate()
    {
        cardVisaCardCollectionView.dataSource = self
        cardVisaCardCollectionView.delegate = self
    }
    
    private func registerCells()
    {
        cardVisaCardCollectionView.registerCustomCells(identifier: VisaCardGeminiCollectionViewCell.identifier)
    }
    
    private func setUpHeightForCollectionView()
    {
        heightOfCardPaymentCollectionView.constant = 215+25
    }
}

extension VisaCardPaymentViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    func configureAnimation()
    {
        let customAnimate = cardVisaCardCollectionView.gemini.scaleAnimation()
        customAnimate.scale(0.65)
        customAnimate.scaleEffect(.scaleUp)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        cardVisaCardCollectionView.animateVisibleCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? VisaCardGeminiCollectionViewCell else {return}
        self.cardVisaCardCollectionView.animateCell(cell)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = cardVisaCardCollectionView.bindCustomCellToTheChambers(identifier: VisaCardGeminiCollectionViewCell.identifier, indexPath: indexPath) as VisaCardGeminiCollectionViewCell
        self.cardVisaCardCollectionView.animateCell(cell)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cardVisaCardCollectionView.bounds.width, height: 215)
    }
    
    
    
}
