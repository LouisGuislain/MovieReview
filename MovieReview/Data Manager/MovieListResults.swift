//
//  MovieListResults.swift
//  MovieReview
//
//  Created by Louis Guislain on 03/02/2020.
//  Copyright © 2020 Louis Guislain. All rights reserved.
//

import Foundation
import UIKit

struct MovieListResult {
    
    let title: String
    let year: Int
    var poster: String
    
    var posterURL: NSURL {
          return NSURL(string: poster)!
      }
}
