//
//  DispatchQueue.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

func onMainQueue(_ block: @escaping () -> Void) {
    DispatchQueue.main.async(execute: block)
}

func onGlobalUtilityQueue(_ block: @escaping () -> Void) {
    DispatchQueue.global(qos: .utility).async(execute: block)
}
