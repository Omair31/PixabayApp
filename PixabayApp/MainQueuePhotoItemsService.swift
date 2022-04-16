//
//  PhotoItemService.swift
//  PixabayApp
//
//  Created by TelloTalk on 08/03/2022.
//

import Foundation

typealias PhotosCompositeService = PhotosAPIProtocol & PhotoSearchAPIProtocol

class MainQueuePhotoItemsService: PhotosCompositeService {
    
    let service: PhotosAPIProtocol
    
    let searchService: PhotoSearchAPIProtocol
    
    init(service: PhotosAPIProtocol, searchService: PhotoSearchAPIProtocol) {
        self.service = service
        self.searchService = searchService
    }
    
    func getPhotoObjects(completion: @escaping (Result<[PhotoObject], Error>) -> Void) {
        service.getPhotoObjects { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let photoObjects):
                    completion(.success(photoObjects))
                case .failure(_):
                    completion(.failure(MappingError.notMapped))
                }
            }
        }
    }
    
    func getPhotoObjects(with searchText: String, completion: @escaping (Result<[PhotoObject],Error>) -> Void) {
        searchService.getPhotoObjects(with: searchText) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let photoObjects):
                    completion(.success(photoObjects))
                case .failure(_):
                    completion(.failure(MappingError.notMapped))
                }
            }
        }
    }
    
}
