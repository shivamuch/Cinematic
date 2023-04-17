//
//  MovieDataSource.swift
//  Cinematic
//
//  Created by Shivam Bajaj on 2023-04-16.
//

import Foundation
import UIKit
import CoreData
class MovieDataSource {

 
    func saveMovie(movie: Movie, completion: @escaping (Movie?, MovieDataSourceError?) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            completion(nil, MovieDataSourceError.CannotSave())
            return
        }

        let managedContext = appDelegate.container.viewContext

        let newMovie = CoreDataMovie(context: managedContext)

        newMovie.setValue(movie.id, forKey: "id")
        newMovie.setValue(movie.overview, forKey: "overview")
        newMovie.setValue(movie.posterPath, forKey: "posterPath")
        newMovie.setValue(movie.releaseDate, forKey: "releaseDate")
        newMovie.setValue(movie.title, forKey: "title")
        newMovie.setValue(movie.voteAverage, forKey: "voteAverage")

        do {
            try managedContext.save()
            completion(movie, nil)
        } catch {
            completion(nil, MovieDataSourceError.CannotSave())
        }
    }

}




