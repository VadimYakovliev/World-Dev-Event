//
//  FullImageTableCell.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

private let imageHeight: CGFloat = 200.0

class FullImageTableCell: UITableViewCell {
    private let imagePreview = UIImageView()
    
    var presentationModel: Activity.DetailsActivity?
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        self.configureCell()
    }
}

extension FullImageTableCell: Configurable {
    func configure(presentationModel: Activity.DetailsActivity) {
        self.imagePreview.setImage(withUrl: presentationModel.imageURL)
    }
}

private extension FullImageTableCell {
    func configureCell() {
        self.selectionStyle = .none
        self.configureImagePreview()
    }
    
    func configureImagePreview() {
        self.imagePreview.contentMode = .scaleAspectFill
        self.imagePreview.loadIndicator(isActive: true)
        
        self.contentView.add(self.imagePreview)
        
        self.imagePreview.snp.makeConstraints { make in
            make.height.equalTo(imageHeight)
            make.left.right.top.bottom.equalToSuperview()
        }
    }
}
