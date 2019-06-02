//
//  UIView+Extensions.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

extension UIView {
    func fillSuperview(withInsets insets: UIEdgeInsets = .zero) {
        self.anchors(top: self.superview?.topAnchor,
                     bottom: self.superview?.bottomAnchor,
                     leading: self.superview?.leadingAnchor,
                     trailing: self.superview?.trailingAnchor,
                     insets: insets)
    }
    
    func fixSize(toView view: UIView) {
        self.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchors(top: NSLayoutYAxisAnchor? = nil,
                 bottom: NSLayoutYAxisAnchor? = nil,
                 leading: NSLayoutXAxisAnchor? = nil,
                 trailing: NSLayoutXAxisAnchor? = nil,
                 insets: UIEdgeInsets = .zero,
                 size: CGSize = .zero) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        top.map { self.topAnchor.constraint(equalTo: $0, constant: insets.top).isActive = true }
        bottom.map { self.bottomAnchor.constraint(equalTo: $0, constant: -insets.bottom).isActive = true }
        leading.map { self.leadingAnchor.constraint(equalTo: $0, constant: insets.left).isActive = true }
        trailing.map { self.trailingAnchor.constraint(equalTo: $0, constant: -insets.right).isActive = true }
        
        if size.width != .zero {
            self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != .zero {
            self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
