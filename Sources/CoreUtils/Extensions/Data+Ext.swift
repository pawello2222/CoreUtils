//
//  Data+Ext.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation

public extension Data {
    func toStringArray() -> [String]? {
        try? JSONDecoder().decode([String].self, from: self)
    }
}

public extension Data {
    func sizeString(units: ByteCountFormatter.Units = [.useAll], countStyle: ByteCountFormatter.CountStyle = .file) -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = units
        formatter.countStyle = countStyle
        return formatter.string(fromByteCount: Int64(count))
    }
}
