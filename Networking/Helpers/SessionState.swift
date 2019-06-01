//
//  SessionState.swift
//  Networking
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

public enum SessionState: Int {
    case running
    case suspended
    case canceling
    case completed
    case undefined
}
