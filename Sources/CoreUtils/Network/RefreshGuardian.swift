//
//  RefreshGuardian.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation

// MARK: - Refresh Guardian Protocol

public protocol RefreshGuardian {
    var refreshGranularity: Calendar.Component { get }
    var refreshInterval: TimeInterval { get }
    var userDefaults: UserDefaults { get }
}

public extension RefreshGuardian {
    func canUpdate(forKey key: String) -> Bool {
        if let lastUpdated = getUpdateTime(forKey: key),
           wasRecentlyUpdated(lastUpdated, granularity: refreshGranularity, value: refreshInterval)
        {
            return false
        }
        return true
    }

    func getUpdateTime(forKey key: String) -> Date? {
        userDefaults.object(forKey: key) as? Date
    }

    func setUpdateTime(_ date: Date, forKey key: String) {
        userDefaults.set(date, forKey: key)
    }

    func wasRecentlyUpdated(_ date: Date, granularity: Calendar.Component, value: TimeInterval) -> Bool {
        let dateAfterMinInterval = Calendar.current.date(byAdding: granularity, value: Int(value), to: date)!
        return Calendar.current
            .compare(dateAfterMinInterval, to: Date(), toGranularity: granularity) == .orderedDescending
    }
}
