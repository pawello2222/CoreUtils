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
    public struct Name: Equatable {
        private let rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }

        public static let `default` = Name(rawValue: "__default__")

        public static func == (lhs: Name, rhs: Name) -> Bool {
            lhs.rawValue == rhs.rawValue
        }
    }

    public final class Container {
        private var dependencies: [(key: Dependencies.Name, value: Any)] = []

        public static let `default` = Container()

        public func register(_ dependency: Any, for key: Dependencies.Name = .default) {
            dependencies.append((key: key, value: dependency))
        }

        public func resolve<T>(_ key: Dependencies.Name = .default) -> T {
            return (dependencies
                .filter { (dependencyTuple) -> Bool in
                    dependencyTuple.key == key
                        && dependencyTuple.value is T
                }
                .first)?.value as! T
        }
    }

    @propertyWrapper
    public struct Inject<T> {
        private let dependencyName: Name
        private let container: Container

        public init(_ dependencyName: Name = .default, on container: Container = .default) {
            self.dependencyName = dependencyName
            self.container = container
        }

        public var wrappedValue: T {
            container.resolve(dependencyName)
        }
    }
}
