//
//  Errors.swift
//  PixabayApp
//
//  Created by TelloTalk on 08/03/2022.
//

import Foundation

enum NetworkError: Error {
    case dataNotFound, dataNotDecodable
}

enum MappingError: Error {
    case notMapped
}
