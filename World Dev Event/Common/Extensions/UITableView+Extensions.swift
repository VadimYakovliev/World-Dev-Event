//
//  UITableView+Extensions.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

extension UITableViewCell: Reusable {}

extension UITableView {
    func registerCellClass<T: UITableViewCell>(_: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.identifier)
    }
}
