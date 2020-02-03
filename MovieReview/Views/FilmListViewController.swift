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
    
    let dataManager = DataManager()
    
    override func viewDidLoad() {
//        let nib = UINib.init(nibName: "MovieListTableViewCell", bundle: nil)
//        self.movieListTableView.register(nib, forCellReuseIdentifier: "MovieListTableViewCell")
        self.searchBar.delegate = self

    }
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        dataManager.MovieTitleSearch(title: searchBar.text ?? "")
//        print("bite")
//    }
}

extension MovieListViewController {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dataManager.MovieTitleSearch(title: searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt IndexPath: IndexPath) {
//        dataManager.MovieTitleSearch(title: )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = movieListTableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as! MovieListTableViewCell
        
        return cell
    }
}
