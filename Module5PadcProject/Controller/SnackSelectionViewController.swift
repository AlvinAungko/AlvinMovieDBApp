//
//  SnackSelectionViewController.swift
//  Module5PadcProject
//
//  Created by Aung Ko Ko on 19/02/2022.
//

import UIKit

class SnackSelectionViewController: UIViewController {

    @IBOutlet weak var priceTotallabel: UILabel!
    @IBOutlet weak var heighOfPaymentCardCollectionView: NSLayoutConstraint!
    @IBOutlet weak var heightOfSnackCollectionView: NSLayoutConstraint!
    @IBOutlet weak var paymentCardCollectionView: UICollectionView!
    @IBOutlet weak var snackCollectionView: UICollectionView!
    
    
    var capturedPriceList:Int = 0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpHeightForCollectionView()
        registerCells()
        setDataSourceAndDelegate()

        // Do any additional setup after loading the view.
    }

    @IBAction func onTabPay(_ sender: Any) {
        navigateToViewController(identifier: MOVIE_VISA_VIEW_CONTROLLER)
    }
    @IBAction func onTabBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SnackSelectionViewController
{
    private func setPayment()
    {
        priceTotallabel.text = "You have to pay \(String(capturedPriceList))$"
    }
}

extension SnackSelectionViewController
{
    private func setDataSourceAndDelegate()
    {
        snackCollectionView.dataSource = self
        snackCollectionView.delegate = self
        
        paymentCardCollectionView.dataSource = self
        paymentCardCollectionView.delegate = self
        
    }
    
    private func registerCells()
    {
        snackCollectionView.registerCustomCells(identifier: SnackCouponCollectionViewCell.identifier)
        paymentCardCollectionView.registerCustomCells(identifier: PaymentCardCollectionViewCell.identifier)
    }
    
    private func setUpHeightForCollectionView()
    {
        heightOfSnackCollectionView.constant = 94*3
        heighOfPaymentCardCollectionView.constant = (56*2)+10
        
        snackCollectionView.layoutIfNeeded()
        paymentCardCollectionView.layoutIfNeeded()
    }
}

extension SnackSelectionViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == snackCollectionView
        {
          return 3
        }
        else
        {
           return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == snackCollectionView
        {
            let cell = snackCollectionView.bindCustomCellToTheChambers(identifier: SnackCouponCollectionViewCell.identifier, indexPath: indexPath) as SnackCouponCollectionViewCell
            cell.onTabPlus =
            {
                capturedValue in
                self.capturedPriceList += Int(capturedValue) ?? 0
                self.setPayment()
                
            }
            
            cell.onTabMinus =
            {
                capturedPrice in
                self.capturedPriceList -= Int(capturedPrice) ?? 0
                self.setPayment()
            }
            return cell
        } else
        {
            let cell = paymentCardCollectionView.bindCustomCellToTheChambers(identifier: PaymentCardCollectionViewCell.identifier, indexPath: indexPath) as PaymentCardCollectionViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == snackCollectionView
        {
            return CGSize(width: snackCollectionView.bounds.width, height: 94)
        } else
        {
            return CGSize(width: paymentCardCollectionView.bounds.width, height: 56)
        }
    }
}
