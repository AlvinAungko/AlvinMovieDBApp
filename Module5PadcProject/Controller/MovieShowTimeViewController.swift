//
//  MovieShowTimeViewController.swift
//  Module5PadcProject
//
//  Created by Alvin  on 15/02/2022.
//

import UIKit

class MovieShowTimeViewController: UIViewController
{

    @IBOutlet weak var heightOfDayCollectionView: NSLayoutConstraint!
    @IBOutlet weak var scrollViewForEntireView: UIScrollView!
    @IBOutlet weak var heightOfThirdCinemaCollectionView: NSLayoutConstraint!
    @IBOutlet weak var heightOfSecondCinemaCollectionView: NSLayoutConstraint!
    @IBOutlet weak var heightOfFirstCinemaCollectionview: NSLayoutConstraint!
    @IBOutlet weak var thirdCinemaCollectionView: UICollectionView!
    @IBOutlet weak var secondCinemaCollectionView: UICollectionView!
    @IBOutlet weak var firstCinemaCollectionView: UICollectionView!
    @IBOutlet weak var dayCalendarCollectionView: UICollectionView!
    
    var dummyDayList = Array<DummyDay>()
    
    var movieAppDele:MovieAppDelegate?
    
    var dummyTimeList = Array<dummyTime>()
    var dummySecondTimeList = Array<dummyTime>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        setUpContentInsetForScrollView()
        setHeightForCollectionView()
        bindDataToTheCalenderList()
        bindDataToTheFirstCinema()
        bindDataToTheRestofTheCinemas()
        registerCells()
        setDataSourceAndDelegate()
        setDelegate()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTabNext(_ sender: Any) {
//        let storyBoard = UIStoryboard.initStoryBoard(identifier: "Main")
//        guard let vc = storyBoard.instantiateViewController(withIdentifier: MOVIE_SEAT_VIEW_CONTROLLER) as? MovieSeatViewController
//        else {
//            debugPrint("No VC")
//            return
//        }
//        vc.modalTransitionStyle = .coverVertical
//        vc.modalPresentationStyle = .formSheet
//        present(vc, animated: true, completion: nil)
        
        movieAppDele?.navigateToMovieList()
        
    }
    @IBAction func onTabBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MovieShowTimeViewController
{
    private func bindDataToTheCalenderList()
    {
        dummyDayList =
        [
            DummyDay(day: "Mon", date: "1", isSelected: false),
            DummyDay(day: "Tues", date: "2", isSelected: false),
            DummyDay(day: "Wed", date: "3", isSelected: false),
            DummyDay(day: "Thurs", date: "4", isSelected: false),
            DummyDay(day: "Fri", date: "5", isSelected: false),
            DummyDay(day: "Sat", date: "6", isSelected: false),
            DummyDay(day: "Sun", date: "7", isSelected: false)
            
        ]
    }
    
    private func bindDataToTheFirstCinema()
    {
        dummyTimeList =
        [
            dummyTime(time: "9:00 AM", isSelected: false),
            dummyTime(time: "12:30 PM", isSelected: false),
            dummyTime(time: "1:45 PM", isSelected: false)
        ]
    }
    
    private func bindDataToTheRestofTheCinemas()
    {
        dummySecondTimeList =
        [
            dummyTime(time: "9:00 AM", isSelected: false),
            dummyTime(time: "12:30 PM", isSelected: false),
            dummyTime(time: "1:45 PM", isSelected: false),
            dummyTime(time: "2:30 PM", isSelected: false),
            dummyTime(time: "4:00 PM", isSelected: false),
            dummyTime(time: "5:39 PM", isSelected: false)
        ]
    }
}

extension MovieShowTimeViewController
{
    private func setUpContentInsetForScrollView()
    {
        scrollViewForEntireView.contentInsetAdjustmentBehavior = .never
        scrollViewForEntireView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       
    }
}

extension MovieShowTimeViewController
{
    
    private func setHeightForCollectionView()
    {
        heightOfDayCollectionView.constant = 84
        heightOfFirstCinemaCollectionview.constant = 56
        heightOfSecondCinemaCollectionView.constant = 56*2
        heightOfThirdCinemaCollectionView.constant = 56*2
        
        dayCalendarCollectionView.layoutIfNeeded()
        firstCinemaCollectionView.layoutIfNeeded()
        secondCinemaCollectionView.layoutIfNeeded()
        thirdCinemaCollectionView.layoutIfNeeded()
    }
    
    private func setDataSourceAndDelegate()
    {
        dayCalendarCollectionView.dataSource = self
        dayCalendarCollectionView.delegate = self
        
        firstCinemaCollectionView.dataSource = self
        firstCinemaCollectionView.delegate = self
        
        secondCinemaCollectionView.dataSource = self
        secondCinemaCollectionView.delegate = self
        
        thirdCinemaCollectionView.dataSource = self
        thirdCinemaCollectionView.delegate = self
    }
    
    private func registerCells()
    {
        dayCalendarCollectionView.registerCustomCells(identifier: DayCollectionViewCell.identifier)
        firstCinemaCollectionView.registerCustomCells(identifier: TimeShowerCollectionViewCell.identifier)
        secondCinemaCollectionView.registerCustomCells(identifier: TimeShowerCollectionViewCell.identifier)
        thirdCinemaCollectionView.registerCustomCells(identifier: TimeShowerCollectionViewCell.identifier)
    }
}

extension MovieShowTimeViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == dayCalendarCollectionView
        {
            return dummyDayList.count
        }else if collectionView == firstCinemaCollectionView
        {
            return dummyTimeList.count
        }
        else
        {
            return dummySecondTimeList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == dayCalendarCollectionView{
            let cell = dayCalendarCollectionView.bindCustomCellToTheChambers(identifier: DayCollectionViewCell.identifier, indexPath: indexPath) as DayCollectionViewCell
            
            cell.bindDataToTheCell(dayVOS: dummyDayList[indexPath.row])
            cell.dayCalender = dummyDayList[indexPath.row]
            
            cell.onTabDayDate =
            {
                onTabDate in
                for eachDate in self.dummyDayList
                {
                    if onTabDate == eachDate.date
                    {
                        eachDate.isSelected = true
                    } else
                    {
                        eachDate.isSelected = false
                    }
                }
                self.dayCalendarCollectionView.reloadData()
            }
            
            return cell
        } else if collectionView == firstCinemaCollectionView
        {
            let cell = firstCinemaCollectionView.bindCustomCellToTheChambers(identifier: TimeShowerCollectionViewCell.identifier, indexPath: indexPath) as TimeShowerCollectionViewCell
            cell.time = dummyTimeList[indexPath.row]
            cell.onTabDay =
            {
                tabbedTime in
                for eachTime in self.dummyTimeList
                {
                    if tabbedTime == eachTime.time
                    {
                        eachTime.isSelected = true
                    } else {
                        eachTime.isSelected = false
                    }
                }
                self.firstCinemaCollectionView.reloadData()
            }
            return cell
        }
        else if collectionView == secondCinemaCollectionView
        {
            let cell = collectionView.bindCustomCellToTheChambers(identifier: TimeShowerCollectionViewCell.identifier, indexPath: indexPath) as TimeShowerCollectionViewCell
            cell.time = dummySecondTimeList[indexPath.row]
            cell.onTabDay =
            {
                tabbedTime in
                for eachTime in self.dummySecondTimeList
                {
                    if tabbedTime == eachTime.time
                    {
                        eachTime.isSelected = true
                    } else {
                        eachTime.isSelected = false
                    }
                }
                self.secondCinemaCollectionView.reloadData()
            }
            return cell
        }
        else
        {
            let cell = thirdCinemaCollectionView.bindCustomCellToTheChambers(identifier: TimeShowerCollectionViewCell.identifier, indexPath: indexPath) as TimeShowerCollectionViewCell
            cell.time = dummySecondTimeList[indexPath.row]
            cell.onTabDay =
            {
                tabbedTime in
                for eachTime in self.dummySecondTimeList
                {
                    if tabbedTime == eachTime.time
                    {
                        eachTime.isSelected = true
                    } else {
                        eachTime.isSelected = false
                    }
                }
                self.thirdCinemaCollectionView.reloadData()
            }
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
            if collectionView == dayCalendarCollectionView
        {
              return CGSize(width: 60, height: 84)
        }
        else if collectionView == firstCinemaCollectionView
        {
            let width = collectionView.bounds.width/3
            let height = CGFloat(48)
            
            return CGSize(width: width, height: height)
        } else
        {
            let width = collectionView.bounds.width/3
            let height = CGFloat(48)
            
            return CGSize(width: width, height: height)
        }
        
    }
}

extension MovieShowTimeViewController:MovieAppDelegate
{
    func navigateToMovieList() {
       navigateToViewController(identifier: MOVIE_SEAT_VIEW_CONTROLLER)
    }
    
}

extension MovieShowTimeViewController
{
    private func setDelegate()
    {
        self.movieAppDele = self
    }
}

