//
//  UIColor+Extensions.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

private let maxColorComponentValue: CGFloat = 255.0

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / maxColorComponentValue,
                  green: CGFloat(green) / maxColorComponentValue,
                  blue: CGFloat(blue) / maxColorComponentValue,
                  alpha: alpha)
    }
}
