//
//  UserDefaults+Ext.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation

public extension UserDefaults {
    @propertyWrapper
    struct Wrap<Value> {
        private let key: String
        private let defaultValue: Value
        private let storage: UserDefaults

        public init(key: String, defaultValue: Value, storage: UserDefaults = .standard) {
            self.key = key
            self.defaultValue = defaultValue
            self.storage = storage
        }

        public var wrappedValue: Value {
            get {
                let value = storage.value(forKey: key) as? Value
                return value ?? defaultValue
            }
            set {
                storage.setValue(newValue, forKey: key)
            }
        }
    }
}

public extension UserDefaults {
    func deleteAll() {
        removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }
}
