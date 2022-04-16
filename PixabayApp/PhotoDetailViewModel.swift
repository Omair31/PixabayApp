//
//  PhotoDetailViewModel.swift
//  PixabayApp
//
//  Created by TelloTalk on 08/03/2022.
//

import Foundation

class PhotoDetailViewModel {
    
    let imageURL: String
    let commentsCount: Int
    let likesCount: Int
    let imageWidth: Double
    let imageHeight: Double
    
    func imageDisplayHeight(screenWidth: Double) -> Double {
        return (screenWidth / imageWidth) * imageHeight
    }
    
    func imageDisplayWidth(screenWidth: Double) -> Double {
        return screenWidth
    }
    
    init(photoObject: PhotoObject) {
        self.imageURL = photoObject.previewURL
        self.commentsCount = photoObject.comments
        self.likesCount = photoObject.likes
        self.imageWidth = photoObject.imageWidth
        self.imageHeight = photoObject.imageHeight
    }
    
}
