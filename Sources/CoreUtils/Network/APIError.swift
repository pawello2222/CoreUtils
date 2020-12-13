//
//  APIError.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case offline
    case network(code: Int, description: String)
    case badRequest(description: String)
    case unauthorized
    case forbidden
    case tooManyRequests
    case recentlyUpdated
    case parsing(description: String)
    case unknown(description: String? = nil)
}
