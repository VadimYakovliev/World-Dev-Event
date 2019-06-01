//
//  URLSessionInterlayer.swift
//  Networking
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

typealias DataTaskCompletion = (Data?, URLResponse?, Error?) -> Void

// MARK: - URLSession wrapper

protocol URLSessionContract {
    func dataTask(with request: URLRequest, completionHandler: DataTaskCompletion?) -> DataTask?
}

final class URLSessionInterlayer: URLSessionContract {
    init() {}
    
    func dataTask(with request: URLRequest, completionHandler: DataTaskCompletion?) -> DataTask? {
        return completionHandler.map { URLSession.shared.dataTask(with: request, completionHandler: $0) }
    }
}

// MARK: - URLSessionDataTask wrapper

protocol DataTask {
    func resume()
    func cancel()
    
    var sessionState: SessionState { get }
}

extension URLSessionDataTask: DataTask {
    var sessionState: SessionState {
        return SessionState(rawValue: self.state.rawValue) ?? .undefined
    }
}
