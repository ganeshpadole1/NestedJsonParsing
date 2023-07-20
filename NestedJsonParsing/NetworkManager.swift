//
//  NetworkManager.swift
//  NestedJsonParsing
//
//  Created by Ganesh on 20/07/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noDataAvailable
}


class NetworkManager {
    
    static func getResponse(url: String, completion: @escaping (Result<[User], NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let response = try decoder.decode([User].self, from: data)
                completion(.success(response))
                
            } catch {
                
            }
        }
        
        task.resume()
    }
}
