//
//  FilmListTableViewCell.swift
//  MovieReview
//
//  Created by Louis Guislain on 02/02/2020.
//  Copyright © 2020 Louis Guislain. All rights reserved.
//

import Foundation
import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet var movieLabel: UILabel!
    
    @IBOutlet var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
