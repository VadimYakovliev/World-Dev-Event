//
//  DataSerializer.swift
//  Networking
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

public extension Data {
    private static let jsonDecoder = JSONDecoder()
    
    func decoded<T: Decodable>() -> T? {
        return try? Data.jsonDecoder.decode(T.self, from: self)
    }
    
    func toJson() -> [AnyHashable: AnyObject]? {
        return try? JSONSerialization.jsonObject(with: self, options: []) as? [AnyHashable : AnyObject]
    }
}

public extension Encodable {
    func encoded() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try encoder.encode(self)
    }
}
