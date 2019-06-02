//
//  CALayer+Extensions.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

private let defaultShadowOpacity: Float = 0.3
private let defaultShadowRadius: CGFloat = 3.0
private let defaultShadowOffset = CGSize(width: 3.0, height: 2.0)

extension CALayer {
    
    // MARK: - Round corners
    func rounded(cornerRadius: CGFloat) {
        let roundedMaskLayer = CAShapeLayer()
        roundedMaskLayer.path = UIBezierPath(roundedRect: self.bounds,
                                             cornerRadius: cornerRadius).cgPath
        self.mask = roundedMaskLayer
    }
    
    // MARK: - Shadow
    func shadow(color: UIColor,
                opacity: Float = defaultShadowOpacity,
                offset: CGSize = defaultShadowOffset,
                radius: CGFloat = defaultShadowRadius) {
        self.masksToBounds = false
        self.shadowColor = color.cgColor
        self.shadowOpacity = opacity
        self.shadowOffset = offset
        self.shadowRadius = radius
    }
}
