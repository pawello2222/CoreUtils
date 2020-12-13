//
//  Dependencies.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation

/// Taken from: https://fmo91.github.io/0002-dependency-injection-using-property-wrappers/
public enum Dependencies {
    struct Name: Equatable {
        let rawValue: String
        static let `default` = Name(rawValue: "__default__")
        static func == (lhs: Name, rhs: Name) -> Bool { lhs.rawValue == rhs.rawValue }
    }

    final class Container {
        private var dependencies: [(key: Dependencies.Name, value: Any)] = []

        static let `default` = Container()

        func register(_ dependency: Any, for key: Dependencies.Name = .default) {
            dependencies.append((key: key, value: dependency))
        }

        func resolve<T>(_ key: Dependencies.Name = .default) -> T {
            return (dependencies
                .filter { (dependencyTuple) -> Bool in
                    dependencyTuple.key == key
                        && dependencyTuple.value is T
                }
                .first)?.value as! T
        }
    }

    @propertyWrapper
    struct Inject<T> {
        private let dependencyName: Name
        private let container: Container
        var wrappedValue: T { container.resolve(dependencyName) }

        init(_ dependencyName: Name = .default, on container: Container = .default) {
            self.dependencyName = dependencyName
            self.container = container
        }
    }
}
