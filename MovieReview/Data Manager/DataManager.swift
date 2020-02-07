//
//  DataManager.swift
//  MovieReview
//
//  Created by Louis Guislain on 02/02/2020.
//  Copyright © 2020 Louis Guislain. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataManager {

    typealias MovieList = ([MovieListResult]?) -> Void
    
    func MovieTitleSearch(title: String, onCompletion: @escaping MovieList) {
        
        let url = "http://www.omdbapi.com/?apikey=443bc5db&page=10&r=json&s=\(title)"
        
        AF.request(url, method: .get).validate().responseJSON(completionHandler: { response in
            switch response.result {
            case.success(let value):
                let json = JSON(value)
                print("PRINT DU JSON DANS LE DATA MANAGER : \(json)")
                do {
                    let resultsDictionnary = try JSONSerialization.jsonObject(with: response.data!, options: [.allowFragments]) as? [String: AnyObject]
                    guard let moviesContainer = resultsDictionnary!["Search"] as? [NSDictionary] else { return }
                        
                        let movieListResult: [MovieListResult] = moviesContainer.map { movieListDictionary in
                            
                            let title = movieListDictionary["Title"] as? String ?? ""
                            let year = movieListDictionary["Year"] as? Int ?? 0
                            let poster = movieListDictionary["Poster"] as? String ?? ""
                            let movieList = MovieListResult(title: title, year: year, poster: poster)
                            
                            return movieList
                        }
                    onCompletion(movieListResult)
                    }
                catch {
                    print("error")
                    return
                }
            case .failure(let error):
                print(error)
                return
            }
        })
        
        //same qu'au dessus
        
        func MovieDetails() {
            
            
            let url = ""
            
            AF.request(url, method: .get).validate().responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("JSON: \(json)")
                case .failure(let error):
                    print(error)
                }
            })
        }
        
    }
}
