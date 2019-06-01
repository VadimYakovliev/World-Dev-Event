//
//  URLRequestHelper.swift
//  Networking
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

public enum RequestType: String {
    case POST
    case GET
}

public enum AuthorizationType {
    case bearer(token: String)
    case none
}

extension URLRequest {
    init?(type: RequestType,
          urlString: String,
          authorizationType: AuthorizationType,
          httpBody: Encodable?) {
        
        guard
            let url = URL(string: urlString)
            else { return nil }
        
        self.init(url: url)
        
        self.httpMethod = type.rawValue
        var authorizationValue: String?
        
        switch authorizationType {
        case .bearer(let token):
            authorizationValue = "Bearer \(token)"
        case .none:
            authorizationValue = nil
        }
        
        authorizationValue.map { self.addValue($0, forHTTPHeaderField: "Authorization") }
        
        if type == .POST,
            let postBody = httpBody {
            self.httpBody = try? postBody.encoded()
            self.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
    }
}


