//
//  GetMoviesDataService.swift
//  MovieSearchEngine
//
//  Created by Lionel Delvaux on 07/10/2022.
//

import Foundation

class GetMoviesDataService {
        
    func fetchMoviesResultData(with query: String, completion: @escaping (Result<MoviesResult, Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=b2168bae3a2c67509eb6b97572f521c2&query=\(query)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(MoviesResult.self, from: data)
                    completion(.success(result))
                } catch let decoderError {
                    print(decoderError)
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
}
