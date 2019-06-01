//
//  Error+Extensions.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Networking

extension Error {
    var description: String {
        return (self as? NetworkErrors)?.rawValue ?? String(describing: self)
    }
}
