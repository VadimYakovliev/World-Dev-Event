//
//  LabelsStackConfigurator.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

typealias LabelsStack = (stack: UIStackView, titleLabel: UILabel, descriptionLabel: UILabel)

enum LabelsStackConfigurator {
    static func getStack(fontFamily: RobotoFont,
                         titleFontSize: CGFloat,
                         descriptFontSize: CGFloat) -> LabelsStack {
        
        let titleLabel = self.configureLabel(withTextColor: Colors.orange,
                                             size: titleFontSize,
                                             fontFamily: fontFamily)
        let descriptionLabel = self.configureLabel(withTextColor: Colors.redBrown,
                                                   size: descriptFontSize,
                                                   fontFamily: fontFamily)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 4.0
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        return (stackView, titleLabel, descriptionLabel)
    }
    
    private static func configureLabel(withTextColor color: UIColor,
                                       size: CGFloat,
                                       fontFamily: RobotoFont) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        
        label.textColor = color
        label.font = Fonts.roboto(type: fontFamily, size: size)
        
        return label
    }
}
