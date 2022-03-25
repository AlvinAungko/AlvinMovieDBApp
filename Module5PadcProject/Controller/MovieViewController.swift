//
//  MovieViewController.swift
//  Module5PadcProject
//
//  Created by Aung Ko Ko on 14/02/2022.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var heightOfComingSoonCollectionView: NSLayoutConstraint!
    @IBOutlet weak var heightOfNowShowingCollectionView: NSLayoutConstraint!
    @IBOutlet weak var comingSoonMovieListCollectionView: UICollectionView!
    @IBOutlet weak var nowShowingMovieListCollectionView: UICollectionView!
    
    var movieAppDelegate:MovieAppDelegate?
    
    var dummyNowShowingMovieList = Array<DummyMovie>()
    
    var dummyUpcomingMovieList = Array<DummyMovie>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        bindMovieToNowShow()
        bindMovieToUpShow()
        setHeightForCollectionViews()
        registerCells()
        setDataSourceDelegate()
        setDelegate()
        

        // Do any additional setup after loading the view.
    }
    
}

extension MovieViewController
{
    private func bindMovieToNowShow()
    {
        dummyNowShowingMovieList = [
            DummyMovie(image: "firstMovieImage", title: "Naruto and the lost sons of Odin", genre: "Horror,Adventure,Comedy"),
            DummyMovie(image: "secondMovieImage", title: "Naruto and the lost sons of Odin", genre: "Anime,Comedy and Dark"),
            DummyMovie(image: "thirdMovieImage", title: "Jigen: The Worst Villain with a moon", genre: "Anime,Horror,Blood"),
            DummyMovie(image: "forthMovieImage", title: "Demon Hunter And Dragon Ball Z Kai", genre: "Horror, Blood, Nowhere"),
            DummyMovie(image: "fifthMovieImage", title: "This is the last anime movie", genre: "Horror, Blood, Humiliation")
        ]
    }
    
    private func bindMovieToUpShow()
    {
        dummyUpcomingMovieList = [
            DummyMovie(image: "sixthMovieImage", title: "Naruto and the lost sons of Odin", genre: "Horror,Adventure,Comedy"),
            DummyMovie(image: "seventhMovieImage", title: "Naruto and the lost sons of Odin", genre: "Anime,Comedy and Dark"),
            DummyMovie(image: "eighthMovieImage", title: "Jigen: The Worst Villain with a moon", genre: "Anime,Horror,Blood"),
            DummyMovie(image: "ninthMovieImage", title: "Demon Hunter And Dragon Ball Z Kai", genre: "Horror, Blood, Nowhere"),
            DummyMovie(image: "tenthMovieImage", title: "This is the last anime movie", genre: "Horror, Blood, Humiliation")
        ]
    }
}

extension MovieViewController
{
    private func setDataSourceDelegate()
    {
        nowShowingMovieListCollectionView.dataSource = self
        nowShowingMovieListCollectionView.delegate = self
        
        comingSoonMovieListCollectionView.dataSource = self
        comingSoonMovieListCollectionView.delegate = self
    }
    
    private func registerCells()
    {
        nowShowingMovieListCollectionView.registerCustomCells(identifier: NowShowingMovieCollectionViewCell.identifier)
        comingSoonMovieListCollectionView.registerCustomCells(identifier: NowShowingMovieCollectionViewCell.identifier)
    }
    
    private func setHeightForCollectionViews()
    {
        heightOfComingSoonCollectionView.constant = 353
        heightOfNowShowingCollectionView.constant = 353
        self.comingSoonMovieListCollectionView.layoutIfNeeded()
        self.nowShowingMovieListCollectionView.layoutIfNeeded()
    }
}

extension MovieViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == nowShowingMovieListCollectionView
        {
            return dummyNowShowingMovieList.count
        } else
        {
            return dummyUpcomingMovieList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == nowShowingMovieListCollectionView
        {
            let cell = nowShowingMovieListCollectionView.bindCustomCellToTheChambers(identifier: NowShowingMovieCollectionViewCell.identifier, indexPath: indexPath) as NowShowingMovieCollectionViewCell
            cell.movie = dummyNowShowingMovieList[indexPath.row]
            return cell
        } else
        {
            let cell = comingSoonMovieListCollectionView.bindCustomCellToTheChambers(identifier: NowShowingMovieCollectionViewCell.identifier, indexPath: indexPath) as NowShowingMovieCollectionViewCell
            cell.movie = dummyUpcomingMovieList[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == nowShowingMovieListCollectionView
        {
            return CGSize(width: nowShowingMovieListCollectionView.bounds.width/1.9, height: heightOfNowShowingCollectionView.constant)
        }
        else
        {
            return CGSize(width: nowShowingMovieListCollectionView.bounds.width/1.8, height: heightOfNowShowingCollectionView.constant)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == nowShowingMovieListCollectionView
        {
            movieAppDelegate?.navigateToMovieList()
        }
        else
        {
            movieAppDelegate?.navigateToMovieList()
        }
    }
}

extension MovieViewController:MovieAppDelegate
{
    func navigateToMovieList() {
        navigateToViewController(identifier: MOVIE_DETAIL_VIEW_CONTROLLER)
    }
    
    
}

extension MovieViewController
{
    private func setDelegate()
    {
        self.movieAppDelegate = self
    }
}

