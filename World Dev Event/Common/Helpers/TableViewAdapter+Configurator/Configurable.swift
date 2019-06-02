//
//  Configurable.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

// MARK: - Configurable View
// (for example cell)

protocol Configurable where Self: UIView {
    associatedtype PresentationModel
    
    var presentationModel: PresentationModel? { get set }
    
    func configure(presentationModel: PresentationModel)
}

// MARK: -
// MARK: Reusable View

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}
