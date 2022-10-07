//
//  HomeViewModel.swift
//  MovieSearchEngine
//
//  Created by Lionel Delvaux on 07/10/2022.
//

import Foundation

class HomeViewModel {
    var coordinator : AppCoordinator?
    let delegate: ViewModelDelegate?
    let title = "Search"
    var movies: [MovieResult] = [] {
        didSet {
            self.delegate?.didLoadData()
        }
    }
    
    init(coordinator: AppCoordinator, delegate: ViewModelDelegate?) {
        self.coordinator = coordinator
        self.delegate = delegate
    }
    
    func searchMovies(query: String){
        let dataService = GetMoviesDataService()
        dataService.fetchMoviesResultData(with: query, completion: { result in
          switch result {
          case .success(let result):
              self.movies = result.results
          case .failure(let error):
              print("Failed to load data : \(error)")
              break
          }
        })
    }
}
