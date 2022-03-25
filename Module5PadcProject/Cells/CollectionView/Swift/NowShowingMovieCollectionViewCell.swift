//
//  NowShowingMovieCollectionViewCell.swift
//  Module5PadcProject
//
//  Created by Aung Ko Ko on 18/02/2022.
//

import UIKit

class NowShowingMovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    var movie:DummyMovie?
    {
        didSet
        {
            if let data = movie
            {
                self.movieTitle.text = data.movieTitle
                self.movieGenre.text = data.movieGenre
                self.movieImage.image = UIImage(named: data.movieImage)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
