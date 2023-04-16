//
//  Service.swift
//  Cinematic
//
//  Created by Shivam Bajaj on 2023-04-16.
//

import Foundation

class Service {

    // MARK: - Utility
    
    func createApiUrl(with path:String, queryItems: [URLQueryItem]) -> URL? {
        var query = [
            URLQueryItem(name: "api_key", value: Constants.api().key),
            URLQueryItem(name: "language", value: Constants.api().language)
        ]
        query.append(contentsOf: queryItems)
        var urlComponents = URLComponents(string: "\(Constants.api().url)\(path)")
        urlComponents?.queryItems = query
        return urlComponents?.url
    }
}

