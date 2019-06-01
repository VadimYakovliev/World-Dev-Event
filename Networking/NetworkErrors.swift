//
//  NetworkErrors.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

public enum NetworkErrors: String, Equatable, Error {
    case cancelled = "Cancelled"
    case notConnectedToInternet = "Not connected to Internet"
    case connectionLost = "Connection was lost"
    case requestTimedOut = "Request timed out"
    case undefined = "Unknown error"
    
    init?(errorCode: Int) {
        switch errorCode {
        case NSURLErrorCancelled:
            self = .cancelled
        case NSURLErrorNotConnectedToInternet:
            self = .notConnectedToInternet
        case NSURLErrorNetworkConnectionLost:
            self = .connectionLost
        case NSURLErrorTimedOut:
            self = .requestTimedOut
        default:
            self = .undefined
        }
    }
}
