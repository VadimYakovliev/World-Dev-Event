//
//  UIView+Extensions.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    // MARK: - Add array of subviews
    
    func add(_ subviews: UIView...) {
        subviews.forEach(self.addSubview)
    }
    
    func equalSizeToSuperview() {
        self.snp.makeConstraints { make in
            make.right.left.bottom.top.equalToSuperview()
        }
    }
    
    func centerInSuperview() {
        self.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
