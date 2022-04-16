//
//  PhotoViewModel.swift
//  PixabayApp
//
//  Created by TelloTalk for Airlift on 08/03/2022.
//

import Foundation

class PhotoViewModel {
    
    let imageWidth: Double
    let imageHeight: Double
    var previewURL: String
    var select: () -> Void
    
    init(photoObject: PhotoObject, selection: @escaping () -> Void) {
        self.imageWidth = photoObject.previewWidth
        self.imageHeight = photoObject.previewHeight
        self.previewURL = photoObject.previewURL
        self.select = selection
    }
    
}
