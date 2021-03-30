//
//  ImageDataProvider.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit
import Kingfisher

private let transitionFade: TimeInterval = 0.4
private let imagePlaceholder = "no_image"

extension UIImageView {
    func loadIndicator(isActive: Bool) {
        self.kf.indicatorType = isActive ? .activity : .none
    }
    
    func setImage(withUrl url: URL?) {
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: imagePlaceholder),
            options: [.transition(.fade(transitionFade)),
                      .scaleFactor(UIScreen.main.scale),
                      .backgroundDecode]
        )
    }
}
