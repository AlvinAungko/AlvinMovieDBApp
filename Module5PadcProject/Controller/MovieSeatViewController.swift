//
//  MovieSeatViewController.swift
//  Module5PadcProject
//
//  Created by Aung Ko Ko on 16/02/2022.
//

import UIKit

class MovieSeatViewController: UIViewController
{
    @IBOutlet weak var paymentTotalButton: UIButton!
    @IBOutlet weak var selecteSeatList: UILabel!
    @IBOutlet weak var numberOfTickets: UILabel!
    @IBOutlet weak var widthOfYourSelection: NSLayoutConstraint!
    @IBOutlet weak var heightOfYourSelection: NSLayoutConstraint!
    @IBOutlet weak var heightOfAvailable: NSLayoutConstraint!
    @IBOutlet weak var widthOfAvailable: NSLayoutConstraint!
    @IBOutlet weak var heightOfReserve: NSLayoutConstraint!
    @IBOutlet weak var widthOfReserve: NSLayoutConstraint!
    @IBOutlet weak var seatCollectionView: UICollectionView!
    
    @IBOutlet weak var heightOfSeatCollectionView: NSLayoutConstraint!
    
    var dummyMovieSeat = Array<DummyMovieSeat>()
    var dummyMoviePrice = Array<DummyPayment>()
    
    var selectedSeatList = Array<String>()
    var totalPayment = 0
    
    override func viewDidLoad()
    {
       
        super.viewDidLoad()
        setUpDummySeatList()
        setUpDummyPrice()
        setUpWidthAndHeight()
        setHeightForSeatCollectionView()
        setUpPayment()
        
        registerCells()
        setDataSourceAndDelegate()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapPay(_ sender: Any) {
        navigateToViewController(identifier: MOVIE_SNACK_VIEW_CONTROLLER)
    }
    @IBAction func onTabBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension MovieSeatViewController
{
    
    private func setUpPayment()
    {
       
        paymentTotalButton.setTitle("Pay \(totalPayment)", for: .normal)
        
    }
    
    private func setUpSelectedSeats()
    {
        selecteSeatList.text = ""
       
        
      for eachText in selectedSeatList
        {
          selecteSeatList.text?.append(contentsOf: eachText)
      }
       
        
        numberOfTickets.text = String(selectedSeatList.count)
    }
}


extension MovieSeatViewController
{
    private func setUpWidthAndHeight()
    {
        widthOfAvailable.constant = 40
        heightOfAvailable.constant = 40
        
        widthOfReserve.constant = 40
        heightOfReserve.constant = 40
        
        widthOfYourSelection.constant = 40
        heightOfYourSelection.constant = 40
        
        self.view.layoutIfNeeded()
    }
    
    private func setUpDummySeatList()
    {
        dummyMovieSeat = [
            DummyMovieSeat(title: "A", type: SEAT_TYPE_TEXT),
            DummyMovieSeat(title: "", type: SEAT_TYPE_EMPTY),
            DummyMovieSeat(title: "A1", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "A2", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "A3", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "A4", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "A5", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "A6", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "", type: SEAT_TYPE_EMPTY),
            DummyMovieSeat(title: "A", type: SEAT_TYPE_TEXT),
            
            DummyMovieSeat(title: "B", type: SEAT_TYPE_TEXT),
            DummyMovieSeat(title: "B1", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "B2", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "B3", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "B4", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "B5", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "B6", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "B7", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "B8", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "B", type: SEAT_TYPE_TEXT),
            
            DummyMovieSeat(title: "C", type: SEAT_TYPE_TEXT),
            DummyMovieSeat(title: "C1", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "C2", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "C3", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "C4", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "C5", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "C6", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "C7", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "C8", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "C", type: SEAT_TYPE_TEXT),
            
            DummyMovieSeat(title: "D", type: SEAT_TYPE_TEXT),
            DummyMovieSeat(title: "D1", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "D2", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "D3", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "D4", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "D5", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "D6", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "D7", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "D8", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "D", type: SEAT_TYPE_TEXT),
            
            DummyMovieSeat(title: "E", type: SEAT_TYPE_TEXT),
            DummyMovieSeat(title: "E1", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "E2", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "E3", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "E4", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "E5", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "E6", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "E7", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "E8", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "E", type: SEAT_TYPE_TEXT),
            
            DummyMovieSeat(title: "F", type: SEAT_TYPE_TEXT),
            DummyMovieSeat(title: "F1", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "F2", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "F3", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "F4", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "F5", type: SEAT_TYPE_RESERVE),
            DummyMovieSeat(title: "F6", type: SEAT_TYPE_RESERVE),
            DummyMovieSeat(title: "F7", type: SEAT_TYPE_RESERVE),
            DummyMovieSeat(title: "F8", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "F", type: SEAT_TYPE_TEXT),
            
            DummyMovieSeat(title: "G", type: SEAT_TYPE_TEXT),
            DummyMovieSeat(title: "G1", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "G2", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "G3", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "G4", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "G5", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "G6", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "G7", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "G8", type: SEAT_TYPE_AVAILABLE),
            DummyMovieSeat(title: "G", type: SEAT_TYPE_TEXT)
        ]
    }
}

extension MovieSeatViewController
{
    private func setUpDummyPrice()
    {
        dummyMoviePrice = [
            DummyPayment(title: "A1", price: 1200),
            DummyPayment(title: "A2", price: 1200),
            DummyPayment(title: "A3", price: 1200),
            DummyPayment(title: "A4", price: 1200),
            DummyPayment(title: "A5", price: 1200),
            DummyPayment(title: "A6", price: 1200),
            
            DummyPayment(title: "B1", price: 2000),
            DummyPayment(title: "B2", price: 2000),
            DummyPayment(title: "B3", price: 2000),
            DummyPayment(title: "B4", price: 2000),
            DummyPayment(title: "B5", price: 2000),
            DummyPayment(title: "B6", price: 2000),
            DummyPayment(title: "B7", price: 2000),
            DummyPayment(title: "B8", price: 2000),
            
            DummyPayment(title: "C1", price: 2500),
            DummyPayment(title: "C2", price: 2500),
            DummyPayment(title: "C3", price: 2500),
            DummyPayment(title: "C4", price: 2500),
            DummyPayment(title: "C5", price: 2500),
            DummyPayment(title: "C6", price: 2500),
            DummyPayment(title: "C7", price: 2500),
            DummyPayment(title: "C8", price: 2500),
            
            DummyPayment(title: "D1", price: 3200),
            DummyPayment(title: "D2", price: 3200),
            DummyPayment(title: "D3", price: 3200),
            DummyPayment(title: "D4", price: 3200),
            DummyPayment(title: "D5", price: 3200),
            DummyPayment(title: "D6", price: 3200),
            DummyPayment(title: "D7", price: 3200),
            DummyPayment(title: "D8", price: 3200),
            
            DummyPayment(title: "E1", price: 4000),
            DummyPayment(title: "E2", price: 4000),
            DummyPayment(title: "E3", price: 4000),
            DummyPayment(title: "E4", price: 4000),
            DummyPayment(title: "E5", price: 4000),
            DummyPayment(title: "E6", price: 4000),
            DummyPayment(title: "E7", price: 4000),
            DummyPayment(title: "E8", price: 4000),
            
            DummyPayment(title: "F1", price: 4500),
            DummyPayment(title: "F2", price: 4500),
            DummyPayment(title: "F3", price: 4500),
            DummyPayment(title: "F4", price: 4500),
            DummyPayment(title: "F5", price: 4500),
            DummyPayment(title: "F6", price: 4500),
            DummyPayment(title: "F7", price: 4500),
            DummyPayment(title: "F8", price: 4500),
            
            DummyPayment(title: "G1", price: 5000),
            DummyPayment(title: "G2", price: 5000),
            DummyPayment(title: "G3", price: 5000),
            DummyPayment(title: "G4", price: 5000),
            DummyPayment(title: "G5", price: 5000),
            DummyPayment(title: "G6", price: 5000),
            DummyPayment(title: "G7", price: 5000),
            DummyPayment(title: "G8", price: 5000)
        ]
    }
}



extension MovieSeatViewController
{
    private func setDataSourceAndDelegate()
    {
        seatCollectionView.dataSource = self
        seatCollectionView.delegate = self
    }
    
    private func registerCells()
    {
        seatCollectionView.registerCustomCells(identifier: SeatCollectionViewCell.identifier)
    }
    
    private func setHeightForSeatCollectionView()
    {
        heightOfSeatCollectionView.constant = 280
        self.view.layoutIfNeeded()
    }
}

extension MovieSeatViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyMovieSeat.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = seatCollectionView.bindCustomCellToTheChambers(identifier: SeatCollectionViewCell.identifier, indexPath: indexPath) as SeatCollectionViewCell
        cell.Seat = dummyMovieSeat[indexPath.row]
        cell.onTabSeat = {
            tabbedSeat in
            
            //Searching Seat in the designated List to reload the collection view with the new data
            
            for eachSeat in self.dummyMovieSeat
            {
                if tabbedSeat == eachSeat.title
                {
                    eachSeat.type = SEAT_TYPE_SELECTED
                    debugPrint(tabbedSeat)
                } else
                {
                    debugPrint("")
                }
            }
            
            for everySeat in self.dummyMoviePrice
            {
                if tabbedSeat == everySeat.title
                {
                    self.totalPayment += everySeat.price
                    self.setUpPayment()
                }
                else
                {
                    debugPrint("")
                }
            }
           
            self.reloadTheViewController(seatThatUserTab:tabbedSeat)
        }
        
        return cell
    }
    
    
    func reloadTheViewController(seatThatUserTab : String)
    {
        self.selectedSeatList.append(seatThatUserTab)
        self.setUpSelectedSeats()
        self.paymentTotalButton.reloadInputViews()
        self.seatCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let width = seatCollectionView.bounds.width/10
        let height = heightOfSeatCollectionView.constant/7
        return CGSize(width: width, height: height)
    }
}
