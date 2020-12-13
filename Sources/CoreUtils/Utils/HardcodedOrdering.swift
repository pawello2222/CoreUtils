//
//  HardcodedOrdering.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation

/// Taken from: https://stackoverflow.com/a/43056896/8697793
public struct HardcodedOrdering<Element> where Element: Hashable {
    public enum UnspecifiedItemSortingPolicy {
        case first
        case last
        case assertAllItemsHaveDefinedSorting
    }

    private let ordering: [Element: Int]
    private let sortingPolicy: UnspecifiedItemSortingPolicy

    public init<S: Sequence>(
        ordering: S,
        sortUnspecifiedItems sortingPolicy: UnspecifiedItemSortingPolicy = .assertAllItemsHaveDefinedSorting
    ) where S.Element == Element {
        self.ordering = Dictionary(uniqueKeysWithValues: zip(ordering, 1...))
        self.sortingPolicy = sortingPolicy
    }

    private func sortKey(for element: Element) -> Int {
        if let definedSortKey = self.ordering[element] { return definedSortKey }

        switch sortingPolicy {
        case .first: return Int.min
        case .last: return Int.max

        case .assertAllItemsHaveDefinedSorting:
            fatalError("Found an element that does not have a defined ordering: \(element)")
        }
    }

    public func contains(_ element: Element) -> Bool {
        return self.ordering.keys.contains(element)
    }

    // For use in sorting a collection of `T`s by the value's yielded by `keyDeriver`.
    // A throwing varient could be introduced, if necessary.
    public func areInIncreasingOrder<T>(by keyDeriver: @escaping (T) -> Element) -> (T, T) -> Bool {
        return { lhs, rhs in
            self.sortKey(for: keyDeriver(lhs)) < self.sortKey(for: keyDeriver(rhs))
        }
    }

    // For use in sorting a collection of `Element`s
    public func areInIncreasingOrder(_ lhs: Element, rhs: Element) -> Bool {
        return sortKey(for: lhs) < sortKey(for: rhs)
    }
}
