//
//  Logger.swift
//  CoreUtils
//
//  Created by Pawel on 13/12/2020.
//  Copyright © 2020 Pawel Wiszenko. All rights reserved.
//

import Foundation
import os.log

@available(iOS 10.0, *)
public enum Logger {
    static func log(_ message: String, category: OSLog, type: OSLogType) {
        os_log("%@", log: category, type: type, message)
    }

    static func debug(_ message: String, category: OSLog) {
        log(message, category: category, type: .debug)
    }

    static func info(_ message: String, category: OSLog) {
        log(message, category: category, type: .info)
    }

    static func error(_ message: String, category: OSLog) {
        log(message, category: category, type: .error)
    }

    static func fault(_ message: String, category: OSLog) {
        log(message, category: category, type: .fault)
    }
}