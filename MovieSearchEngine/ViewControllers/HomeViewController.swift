//
//  HomeViewController.swift
//  MovieSearchEngine
//
//  Created by Lionel Delvaux on 07/10/2022.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel?
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        self.moviesTableView.delegate = self
        self.moviesTableView.dataSource = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
    }
    
    private func displayMoviesData() {
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
    
}

extension HomeViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, text.count >= 3 else { return }
        self.viewModel?.searchMovies(query: text)
    }
}

extension HomeViewController : ViewModelDelegate {
    func didLoadData() {
        self.displayMoviesData()
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell",
                                 for: indexPath) as! MovieCell

        let movieData = self.viewModel?.movies[indexPath.row]
            
        cell.movieTitle?.text = movieData?.originalTitle
        cell.MovieDate?.text = movieData?.releaseDate

        return cell
    }
    
}
