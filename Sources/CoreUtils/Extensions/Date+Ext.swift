//
//  Date+Ext.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation

public extension Date {
    func addingDays(_ value: Int) -> Self {
        Calendar.current.date(byAdding: .day, value: value, to: self)!
    }

    mutating func addDays(_ value: Int) {
        self = addingDays(value)
    }
}

public extension Date {
    func addingHours(_ value: Int) -> Self {
        Calendar.current.date(byAdding: .hour, value: value, to: self)!
    }

    mutating func addHours(_ value: Int) {
        self = addingHours(value)
    }
}

public extension Date {
    func addingSeconds(_ value: Int) -> Self {
        Calendar.current.date(byAdding: .second, value: value, to: self)!
    }

    mutating func addSeconds(_ value: Int) {
        self = addingSeconds(value)
    }
}
