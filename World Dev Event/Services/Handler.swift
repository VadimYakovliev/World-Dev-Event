//
//  Handler.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

typealias Handler<T> = (Result<T, Error>) -> Void
