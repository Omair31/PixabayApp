//
//  ViewModel.swift
//  PixabayApp
//
//  Created by TelloTalk on 08/03/2022.
//

import Foundation

enum DecodingError: Error {
    case dataNotDecodable
}

class PhotoGridViewModel {
    
    private var photoViewModels: [PhotoViewModel] = [] {
        didSet {
            self.photosGridViewDelegate?.dataDidUpdate()
        }
    }
    
    let selection: (PhotoObject) -> Void
    
    var itemsCount: Int {
        return photoViewModels.count
    }
    
    let photosCompositeService: PhotosCompositeService
    
    weak var photosGridViewDelegate: PhotosGridViewDelegate?
    
    init(service: PhotosCompositeService, selection: @escaping (PhotoObject) -> Void) {
        self.photosCompositeService = service
        self.selection = selection
    }
    
    func loadPhotoObjects() {
        photosCompositeService.getPhotoObjects { result in
            switch result {
            case .success(let photoObjects):
                self.photoViewModels = photoObjects.map({ photoObject in
                    return PhotoViewModel(photoObject: photoObject) {
                        self.selection(photoObject)
                    }
                })
            case .failure(_):
                self.photosGridViewDelegate?.showDataNotAvailable()
            }
        }
    }
    
    func searchItem(with searchText: String) {
        photosCompositeService.getPhotoObjects(with: searchText) { result in
            switch result {
            case .success(let photoObjects):
                self.photoViewModels = photoObjects.map({ photoObject in
                    return PhotoViewModel(photoObject: photoObject) {
                        self.selection(photoObject)
                    }
                })
            case .failure(_):
                self.photosGridViewDelegate?.showDataNotAvailable()
            }
        }
    }
    
    func item(at indexPath: IndexPath) -> PhotoViewModel {
        return photoViewModels[indexPath.row]
    }
    
    func selectItem(at indexPath: IndexPath) {
        photoViewModels[indexPath.row].select()
    }
    
}
