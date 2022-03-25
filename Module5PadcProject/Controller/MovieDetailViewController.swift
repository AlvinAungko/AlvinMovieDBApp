//
//  MovieDetailViewController.swift
//  Module5PadcProject
//
//  Created by Aung Ko Ko on 18/02/2022.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var dummyGenreList = Array<GenreTitle>()
    var dummyActorList = Array<Actor>()

    @IBOutlet weak var heightOfActorCollectionView: NSLayoutConstraint!
    @IBOutlet weak var heightOfGenreCollectionView: NSLayoutConstraint!
    @IBOutlet weak var actorCollectionView: UICollectionView!
    @IBOutlet weak var genreCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bindDataToTheList()
        setUpHeightForCollectionView()
        registerCells()
        setDataSourceAndDelegate()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTabNext(_ sender: Any)
    {
        navigateToViewController(identifier: MOVIE_SHOWTIME_VIEW_CONTROLLER)
    }
    @IBAction func onTabBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MovieDetailViewController
{
    private func bindDataToTheList()
    {
        dummyActorList = [
            Actor(name: "firstMovieImage"),
            Actor(name: "secondMovieImage"),
            Actor(name: "thirdMovieImage"),
            Actor(name: "forthMovieImage"),
            Actor(name: "fifthMovieImage")
        ]
        
        dummyGenreList = [
            GenreTitle(title: "Action"),
            GenreTitle(title: "Horror"),
            GenreTitle(title: "Comedy")
        ]
    }
}

extension MovieDetailViewController
{
    private func setDataSourceAndDelegate()
    {
        genreCollectionView.dataSource = self
        genreCollectionView.delegate = self
        
        actorCollectionView.dataSource = self
        actorCollectionView.delegate = self
    }
    
    private func registerCells()
    {
        genreCollectionView.registerCustomCells(identifier: GenreCollectionViewCell.identifier)
        actorCollectionView.registerCustomCells(identifier: ActorCollectionViewCell.identifier)
    }
    
    private func setUpHeightForCollectionView()
    {
        heightOfGenreCollectionView.constant = 40
        heightOfActorCollectionView.constant = 128
        
        genreCollectionView.layoutIfNeeded()
        actorCollectionView.layoutIfNeeded()
    }
}

extension MovieDetailViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == genreCollectionView
        {
            return dummyGenreList.count
        } else
        {
            return dummyActorList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == genreCollectionView
        {
            let cell = genreCollectionView.bindCustomCellToTheChambers(identifier: GenreCollectionViewCell.identifier, indexPath: indexPath) as GenreCollectionViewCell
            cell.genre = dummyGenreList[indexPath.row]
            return cell
        }
        else
        {
            let cell = actorCollectionView.bindCustomCellToTheChambers(identifier: ActorCollectionViewCell.identifier, indexPath: indexPath) as ActorCollectionViewCell
            cell.actorDetail = dummyActorList[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == genreCollectionView
        {
            return CGSize(width: widthOfString(content: dummyGenreList[indexPath.row].genreTitle, font: UIFont(name: "Poppins-Light ", size: 16) ?? UIFont.systemFont(ofSize: 12))+50, height: 40)
        }
        else
        {
            return CGSize(width: 120, height: 120)
        }
    }
    
    func widthOfString(content:String,font:UIFont) -> CGFloat
    {
        var attributedString = Dictionary<NSMutableAttributedString.Key,UIFont>()
        attributedString = [NSMutableAttributedString.Key.font:font]
        let sizeOfText = content.size(withAttributes: attributedString)
        return sizeOfText.width
    }
}
