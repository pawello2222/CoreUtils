//
//  String+Ext.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation

public extension String {
    var isHexNumber: Bool {
        filter(\.isHexDigit).count == count
    }
}
