//
//  Endpoint.swift
//  PixabayApp
//
//  Created by TelloTalk on 08/03/2022.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    static func search(matching query: String) -> Endpoint {
        return Endpoint(
            path: "/api",
            queryItems: [
                URLQueryItem(name: "key", value: "26033441-88848dad313ec08d2d64fa36c"),
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "image_type", value: "photo")
            ]
        )
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pixabay.com"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
