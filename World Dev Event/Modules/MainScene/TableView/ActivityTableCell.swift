//
//  ActivityTableCell.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

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
        
        let contentView = self.contentView
        contentView.addSubview(self.titleLabel)
        
        let insets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        self.titleLabel.anchors(top: contentView.topAnchor,
                                bottom: contentView.bottomAnchor,
                                leading: contentView.leadingAnchor,
                                trailing: contentView.trailingAnchor,
                                insets: insets)
    }
}
