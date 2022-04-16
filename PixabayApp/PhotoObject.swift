//
//  PhotoObject.swift
//  PixabayApp
//
//  Created by Omeir Ahmed on 08/03/2022.
//

import Foundation

struct PhotoObject: Decodable {
    let id: Int
    let pageURL: String
    let type: String
    let tags: String
    let previewURL: String
    let previewWidth: Double
    let previewHeight: Double
    let webformatURL: String
    let webformatWidth: Int
    let webformatHeight: Int
    let largeImageURL: String
    let imageWidth: Double
    let imageHeight: Double
    let imageSize: Int
    let views: Int
    let downloads: Int
    let collections: Int
    let likes: Int
    let comments: Int
    let userID: Int
    let user: String
    let userImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, pageURL, type, tags, previewURL, previewWidth, previewHeight, webformatURL, webformatWidth, webformatHeight, largeImageURL, imageWidth, imageHeight, imageSize, views, downloads, collections, likes, comments
        case userID = "user_id"
        case user, userImageURL
    }
}

struct PhotoData: Decodable {
    let total: Int
    let totalHits: Int
    let hits: [PhotoObject]
}



