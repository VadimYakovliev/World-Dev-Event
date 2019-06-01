//
//  Logger.swift
//  Networking
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

private let LogType = "NETWORKING"

public enum Logger {
    static func log(message: Any) {
        let logMessage = "\(Date().description) | [\(LogType)]:\n\(message)\n-==-"
        print(#function, "\n 📡 \(logMessage) 📡")
    }
}
