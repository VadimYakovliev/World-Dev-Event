//
//  UIStyles.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

enum Colors {
    static let orange = UIColor(red: 240, green: 82, blue: 35) // #f05223
    static let redBrown = UIColor(red: 118, green: 34, blue: 20) // #762214
}

enum Fonts {
    static func roboto(type: RobotoFont, size: CGFloat) -> UIFont? {
        return UIFont(name: type.rawValue, size: size)
    }
}
