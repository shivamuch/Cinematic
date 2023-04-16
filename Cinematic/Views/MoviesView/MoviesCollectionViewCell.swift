//
//  MoviesCollectionViewCell.swift
//  Cinematic
//
//  Created by Shivam Bajaj on 2023-04-15.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var posterImage: CustomImageView!

    // MARK: - Object lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.sizeToFit()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.numberOfLines = 2
    }

    // MARK: - Setup

    func setupCell(with movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = movie.releaseYear
        posterImage.loadImageUsing(path: movie.smallPosterPath)
    }
}

    


