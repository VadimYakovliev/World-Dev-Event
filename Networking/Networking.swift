//
//  Networking.swift
//  Networking
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

private let millisecondCount: TimeInterval = 1_000

public typealias NetworkingHandler = (Result<Data?, Error>) -> Void

public protocol NetworkingContract {
    func execute(type: RequestType,
                 urlString: String,
                 authorizationType: AuthorizationType,
                 httpBody: Encodable?,
                 completion: NetworkingHandler?)
    
    func cancel()
    
    var sessionState: SessionState { get }
}

public final class Networking {
    private var urlSession: URLSessionContract
    private var dataTask: DataTask?
    
    public init(urlSession: URLSessionContract = URLSessionInterlayer()) {
        self.urlSession = urlSession
    }
}

extension Networking: NetworkingContract {
    public func execute(type: RequestType,
                        urlString: String,
                        authorizationType: AuthorizationType,
                        httpBody: Encodable?,
                        completion: NetworkingHandler?) {
        
        guard
            let request = URLRequest(type: type,
                                     urlString: urlString,
                                     authorizationType: authorizationType,
                                     httpBody: httpBody)
            else { completion?(.failure(HTTPStatus.undefined)); return }
        
        let requestDate = Date()
        
        Logger.log(message: "Request started\n\(urlString)")
        Logger.log(message: "HTTP body is\n\(httpBody ?? "No HttpBody")")
        
        self.serverRequest(request) { [weak self] data, response, error in
            guard
                let self = self
                else { return }
            
            Logger.log(message: "Request completed (\(Int(Date().timeIntervalSince(requestDate) * millisecondCount)) ms): \(urlString)")
            Logger.log(message: "HTTP Status == \(String(describing: response?.httpStatus))")
            
            if let error = error {
                self.handle(error: error, completion: completion)
            } else {
                self.handle(response: response as? HTTPURLResponse, data: data, completion: completion)
            }
        }
    }
    
    public func cancel() {
        self.dataTask?.cancel()
    }
    
    public var sessionState: SessionState {
        return self.dataTask?.sessionState ?? .undefined
    }
}

private extension Networking {
    func serverRequest(_ request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask = self.urlSession.dataTask(with: request, completionHandler: completion)
        self.dataTask?.resume()
    }
    
    func handle(response: HTTPURLResponse?, data: Data?, completion: NetworkingHandler?) {
        guard
            let code = response?.statusCode
            else { completion?(.failure(HTTPStatus.undefined)); return }
        
        let status = HTTPStatus(statusCode: code)
        
        guard case .success = status else {
            completion?(.failure(status))
            return
        }
        
        completion?(.success(data))
    }
    
    func handle(error: Error, completion: NetworkingHandler?) {
        guard
            let networkErrors = NetworkErrors(errorCode: error._code)
            else { completion?(.failure(error)); return }
        
        completion?(.failure(networkErrors))
    }
}
