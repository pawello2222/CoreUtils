//
//  WebRepository.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

#if canImport(Combine)
import Combine
import Foundation

@available(iOS 13.0, *)
public protocol WebRepository {
    var session: URLSession { get }
}

@available(iOS 13.0, *)
public extension WebRepository {
    func fetch(url: URL) -> AnyPublisher<Data, APIError> {
        return fetch(request: URLRequest(url: url))
    }

    func fetch(request: URLRequest) -> AnyPublisher<Data, APIError> {
        return session.dataTaskPublisher(for: request)
            .mapError { error in
                if error.code.rawValue == -1009 {
                    return .offline
                }
                return .network(code: error.code.rawValue, description: error.localizedDescription)
            }
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
#endif
