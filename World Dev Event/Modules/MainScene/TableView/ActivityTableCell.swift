//
//  ActivityTableCell.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit
import SnapKit

class ActivityTableCell: UITableViewCell {
    
    private var titleLabel = UILabel()
    
    var presentationModel: Activity?
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        self.configureCell()
    }
}

extension ActivityTableCell: Configurable {
    func configure(presentationModel: Activity) {
        self.presentationModel = presentationModel
        
        self.titleLabel.text = presentationModel.title
    }
}

private extension ActivityTableCell {
    func configureCell() {
        self.backgroundColor = .clear
        self.configureTitleLabel()
    }
    
    func configureTitleLabel() {
        self.titleLabel.textAlignment = .left
        self.titleLabel.lineBreakMode = .byTruncatingTail
        self.titleLabel.numberOfLines = 1
        
        self.titleLabel.textColor = Colors.orange
        self.titleLabel.font = Fonts.roboto(type: .regular, size: 20.0)

        self.contentView.add(self.titleLabel)

        self.titleLabel.equalSizeToSuperview()
    }
}
