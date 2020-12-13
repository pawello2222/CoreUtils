//
//  NSDecimalNumber+Ext.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation

public extension NSDecimalNumber {
    static func + (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
        return lhs.adding(rhs, withBehavior: NSDecimalNumberHandler(roundingMode: .plain, scale: 8, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false))
    }

    static func - (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
        return lhs.subtracting(rhs, withBehavior: NSDecimalNumberHandler(roundingMode: .plain, scale: 8, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false))
    }

    static func * (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
        return lhs.multiplying(by: rhs, withBehavior: NSDecimalNumberHandler(roundingMode: .plain, scale: 8, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false))
    }

    static func / (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
        return lhs.dividing(by: rhs, withBehavior: NSDecimalNumberHandler(roundingMode: .plain, scale: 8, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false))
    }
}

public extension NSDecimalNumber {
    static func += (lhs: inout NSDecimalNumber, rhs: NSDecimalNumber) {
        lhs = lhs + rhs
    }
}

public extension NSDecimalNumber {
    static func == (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
        return lhs.compare(rhs) == .orderedSame
    }

    static func < (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
        return lhs.compare(rhs) == .orderedAscending
    }

    static func > (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
        return lhs.compare(rhs) == .orderedDescending
    }

    static func <= (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
        return [.orderedAscending, .orderedSame].contains(lhs.compare(rhs))
    }

    static func >= (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
        return [.orderedDescending, .orderedSame].contains(lhs.compare(rhs))
    }
}

public extension NSDecimalNumber {
    func rounded(toPlaces decimals: Int) -> NSDecimalNumber {
        return rounding(accordingToBehavior:
            NSDecimalNumberHandler(
                roundingMode: .plain,
                scale: Int16(decimals),
                raiseOnExactness: false,
                raiseOnOverflow: false,
                raiseOnUnderflow: false,
                raiseOnDivideByZero: false
            )
        )
    }
}

public extension NSDecimalNumber {
    enum Sign {
        case neutral, positive, negative
    }

    var sign: Sign? {
        guard self != .notANumber else {
            return nil
        }
        if self > 0 {
            return .positive
        } else if self < 0 {
            return .negative
        } else {
            return .neutral
        }
    }
}

public extension NSDecimalNumber {
    var absoluteValue: NSDecimalNumber {
        if self.compare(NSDecimalNumber.zero) == .orderedAscending {
            return self * -1
        } else {
            return self
        }
    }
}
