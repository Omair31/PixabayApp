//
//  PhotosAPI.swift
//  PixabayApp
//
//  Created by TelloTalk on 08/03/2022.
//

import Foundation

protocol PhotosAPIProtocol {
    func getPhotoObjects(completion: @escaping (Result<[PhotoObject],Error>) -> Void)
}

protocol PhotoSearchAPIProtocol {
    func getPhotoObjects(with searchText: String, completion: @escaping (Result<[PhotoObject],Error>) -> Void)
}

class PhotosAPI: PhotosAPIProtocol {
    
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getPhotoObjects(completion: @escaping (Result<[PhotoObject],Error>) -> Void) {
        let url = Endpoint.search(matching: "yellow flower").url!
        client.load(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let photoData = try JSONDecoder().decode(PhotoData.self, from: data)
                    let photoObjects = photoData.hits
                    completion(.success(photoObjects))
                } catch {
                    completion(.failure(NetworkError.dataNotDecodable))
                }
            case .failure(_):
                break
            }
        }
    }
    
}

class PhotoSearchAPI: PhotoSearchAPIProtocol {
    
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func getPhotoObjects(with searchText: String, completion: @escaping (Result<[PhotoObject],Error>) -> Void) {
        let url = Endpoint.search(matching: searchText).url!
        client.load(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let photoData = try JSONDecoder().decode(PhotoData.self, from: data)
                    let photoObjects = photoData.hits
                    completion(.success(photoObjects))
                } catch {
                    completion(.failure(NetworkError.dataNotDecodable))
                }
            case .failure(_):
                break
            }
        }
    }
    
}
