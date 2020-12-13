//
//  Array+Ext.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    mutating func toggle(_ element: Element) {
        if let index = firstIndex(where: { $0 == element }) {
            remove(at: index)
        } else {
            append(element)
        }
    }
}

@available(iOS 13.0, *)
public extension Array where Element: Identifiable {
    var uniques: Array {
        var buffer = Array()
        var added = Set<Element.ID>()
        for elem in self {
            if !added.contains(elem.id) {
                buffer.append(elem)
                added.insert(elem.id)
            }
        }
        return buffer
    }
}

public extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let leftSplit = self[0 ..< count / 2]
        let rightSplit = self[count / 2 ..< count]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}

public extension Array where Element: Encodable {
    func toData() -> Data? {
        try? JSONEncoder().encode(self)
    }
}
