//
//  FilmListViewController.swift
//  MovieReview
//
//  Created by Louis Guislain on 02/02/2020.
//  Copyright © 2020 Louis Guislain. All rights reserved.
//

import Foundation
import UIKit

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var movieListTableView: UITableView!
    
    private let dataManager = DataManager()
    private var movies: [MovieListResult] = []
    
    override func viewDidLoad() {
        self.searchBar.delegate = self

    }
}






extension MovieListViewController {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dataManager.MovieTitleSearch(title: searchBar.text ?? "", onCompletion: { (movieList: [MovieListResult]?)
            -> Void in
            self.movies = movieList!
        })
        print(">>>>>>>>>>>>>>>>>> \(movieListTableView.hasUncommittedUpdates)")
        self.movieListTableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt IndexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = movieListTableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as! MovieListTableViewCell
//        let posterData = try? Data(contentsOf: movies[indexPath.row].posterURL as URL)
//        cell.posterImageView.image = UIImage(data: posterData!)
//        cell.movieLabel.text = movies[indexPath.row].title
        return cell
    }
}
