//
//  GenreService.swift
//  Cinematic
//
//  Created by Shivam Bajaj on 2023-04-16.
//

import Foundation

struct Genres: Codable {
    var genres: [Genre] = []
}

class GenreService: Service {

    // MARK: - Requests

    func fetchGenres(with
        completion: @escaping ([Genre]?, GenreServiceError?) -> ()) {

        let path = "/genre/movie/list"

        guard let url = createApiUrl(with: path, queryItems: []) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> () in
            do {
                if error != nil {
                    completion(nil, GenreServiceError.CannotFetch())
                    return
                }
                guard let data = data else {
                    completion(nil, GenreServiceError.CannotFetch())
                    return
                }

                let result = try JSONDecoder().decode(Genres.self, from: data)
                completion(result.genres, nil)
            } catch {
                completion(nil, GenreServiceError.CannotFetch())
            }
        }).resume()
    }
}

// MARK: - Request errors

enum GenreServiceError: Equatable, Error {
  case CannotFetch(String = "not able to fetch" +
                            "internet connection is not available")
}

