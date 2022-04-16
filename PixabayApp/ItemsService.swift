//
//  ItemsService.swift
//  PixabayApp
//
//  Created by TelloTalk on 08/03/2022.
//

import Foundation

protocol ItemsService {
    func load(completion: @escaping (Result<[PhotoViewModel],Error>) -> Void)
}

protocol SearchItemsService {
    func fetchPhotoObjects(with searchText: String, completion: @escaping (Result<[PhotoViewModel],Error>) -> Void)
}
