//
//  ServerAPI.swift
//  RSSSample
//
//  Created by Nguyen Hai Dang on 7/7/20.
//  Copyright © 2020 Hai Dang Nguyen. All rights reserved.
//

import Foundation
public enum ErrorStatusCode: Error {
    case decodeFailure
    case invalidResponse
    case invalidData
    case invalidUrl
}
class ServerAPI {
    public static let defaultAPI = ServerAPI()
    let urlSession = URLSession.shared
    
    func fetchAlbumFromRSS(completion: @escaping (Result<[Album],ErrorStatusCode>) -> Void) {
        guard let url = URL(string: URLConstants.baseURL) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        urlSession.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(RawData.self, from: data).feed.results
                completion(.success(result))
            } catch {
                completion(.failure(.decodeFailure))
            }
        }.resume()
        
    }
}
