//
//  APIError.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation

public enum APIError {
    case offline
    case network(code: Int, description: String)
    case invalidRequest(description: String)
    case recentlyUpdated
    case unknown(description: String? = nil)
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .offline:
            return "No Internet connection."
        case .network(let code, let description):
            return "Network error: (\(code)) \(description)"
        case .invalidRequest(let description):
            return "Invalid request: \(description)"
        case .recentlyUpdated:
            return "Recently updated"
        case .unknown(let description):
            return "Unknown error" + (description != nil ? ": \(description!)" : "")
        }
    }
}
