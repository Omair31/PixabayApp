//
//  HTTPClient.swift
//  PixabayApp
//
//  Created by TelloTalk on 08/03/2022.
//

import Foundation

protocol HTTPClient {
    func load(url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

class URLSessionHTTPClient: HTTPClient {
    
    func load(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(.failure(error!))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.dataNotFound))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
    
}
