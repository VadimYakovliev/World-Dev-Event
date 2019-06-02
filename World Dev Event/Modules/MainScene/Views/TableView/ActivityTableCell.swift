//
//  ActivityTableCell.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit
import SnapKit

private let titleFontSize: CGFloat = 20.0
private let descriptFontSize: CGFloat = 14.0
private let imageSizeValue: CGFloat = 60.0

private let containerInset: CGFloat = 10.0
private let containerHorizontalInsetRatio: CGFloat = 0.06

class ActivityTableCell: UITableViewCell {
    
    private let containerView = UIView()
    
    private let imagePreview = UIImageView()
    private var titleLabel = UILabel()
    private var descriptionLabel = UILabel()
    
    var presentationModel: Activity?
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        self.configureCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.presentationModel = nil
        self.imagePreview.image = nil
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
    }
}

extension ActivityTableCell: Configurable {
    func configure(presentationModel: Activity) {
        self.presentationModel = presentationModel
        
        self.imagePreview.setImage(withUrl: self.presentationModel?.preview.imageURL)
        
        self.updateLabelsContent()
    }
}

private extension ActivityTableCell {
    func configureCell() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        self.configureContainerView()
        self.configureImagePreview()
        self.configureLabelsWithStack()
    }
    
    func configureContainerView() {
        self.contentView.add(self.containerView)
        
        let leftInset = self.contentView.bounds.width * containerHorizontalInsetRatio
        let containerInsets = UIEdgeInsets(top: containerInset,
                                           left: leftInset,
                                           bottom: containerInset,
                                           right: containerInset)
        
        self.containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.contentView).inset(containerInsets)
        }
    }
    
    func configureImagePreview() {
        self.imagePreview.contentMode = .scaleAspectFill
        self.imagePreview.loadIndicator(isActive: true)
        
        self.containerView.add(self.imagePreview)
        
        self.imagePreview.snp.makeConstraints { make in
            make.width.height.equalTo(imageSizeValue)
            make.left.top.bottom.equalToSuperview()
        }
    }
    
    func configureLabelsWithStack() {
        self.titleLabel = self.configureLabel(withTextColor: Colors.orange, size: titleFontSize)
        self.descriptionLabel = self.configureLabel(withTextColor: Colors.redBrown, size: descriptFontSize)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 4.0
        
        stackView.addArrangedSubview(self.titleLabel)
        stackView.addArrangedSubview(self.descriptionLabel)
        
        self.containerView.add(stackView)
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.imagePreview.snp.right).offset(titleFontSize)
            make.right.equalToSuperview()
        }
        
        self.updateLabelsContent()
    }
    
    func configureLabel(withTextColor color: UIColor, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        
        label.textColor = color
        label.font = Fonts.roboto(type: .regular, size: size)
        
        return label
    }
    
    func updateLabelsContent() {
        self.titleLabel.text = self.presentationModel?.title
        self.descriptionLabel.text = self.presentationModel?.preview.description
    }
}
