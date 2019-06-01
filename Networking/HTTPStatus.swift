//
//  HTTPStatus.swift
//  Networking
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

enum HTTPStatus: Error {
    case informational
    case success
    case redirection
    case clientError
    case serverError
    case undefined
    
    init(statusCode: Int) {
        switch statusCode {
        case 100..<200:
            self = .informational
        case 200..<300:
            self = .success
        case 300..<400:
            self = .redirection
        case 400..<500:
            self = .clientError
        case 500..<600:
            self = .serverError
        default:
            self = .undefined
        }
    }
}

private let undefinedCode = -1

extension URLResponse {
    var httpStatus: HTTPStatus {
        return HTTPStatus(statusCode:
            (self as? HTTPURLResponse)?.statusCode ?? undefinedCode)
    }
}
