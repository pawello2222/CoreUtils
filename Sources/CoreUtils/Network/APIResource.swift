//
//  APIResource.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation

public protocol APIResource {
    associatedtype Response: Decodable
    var serverPath: String { get }
    var methodPath: String { get }
    var queryItems: [URLQueryItem]? { get }
}

public extension APIResource {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = serverPath
        components.path = methodPath
        components.queryItems = queryItems
        return components.url
    }
}
