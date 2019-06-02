//
//  DetailsTableCell.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

private let titleFontSize: CGFloat = 20.0
private let shortDescriptFontSize: CGFloat = 12.0
private let descriptFontSize: CGFloat = 16.0

private let containerInset: CGFloat = 23.0
private let containerHorizontalInsetRatio: CGFloat = 0.05

private let buttonHeight: CGFloat = 50.0

class DetailsTableCell: UITableViewCell {
    
    private let stackView = UIStackView()
    private let button = UIButton(type: .system)
    
    private var titleLabel = UILabel()
    private var shortDescriptionLabel = UILabel()
    
    private var descriptionLabel = UILabel()
    
    var presentationModel: Activity?
}

extension DetailsTableCell: Configurable {
    func configure(presentationModel: Activity) {
        self.presentationModel = presentationModel
        
        self.configureCell()
        
        self.titleLabel.text = self.presentationModel?.title
        self.shortDescriptionLabel.text = self.presentationModel?.preview.description
        self.descriptionLabel.text = self.presentationModel?.details.description
    }
}

private extension DetailsTableCell {
    func configureCell() {
        self.selectionStyle = .none
        self.configureDescriptionLabel()
        self.configureButton()
        self.configureLabelsWithStack()
    }
    
    func configureDescriptionLabel() {
        self.descriptionLabel.textAlignment = .natural
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = Fonts.roboto(type: .regular, size: descriptFontSize)
    }
    
    func configureLabelsWithStack() {
        let labelsStack = LabelsStackConfigurator.getStack(fontFamily: .medium,
                                                           titleFontSize: titleFontSize,
                                                           descriptFontSize: shortDescriptFontSize)
        
        self.titleLabel = labelsStack.titleLabel
        self.shortDescriptionLabel = labelsStack.descriptionLabel
 
        self.stackView.axis = .vertical
        self.stackView.distribution = .fill
        self.stackView.alignment = .fill
        self.stackView.spacing = 14.0
        
        self.stackView.addArrangedSubview(labelsStack.stack)
        self.stackView.addArrangedSubview(self.descriptionLabel)
        
        self.contentView.add(self.stackView)

        let leftInset = self.contentView.bounds.width * containerHorizontalInsetRatio
        let containerInsets = UIEdgeInsets(top: containerInset,
                                           left: leftInset,
                                           bottom: containerInset,
                                           right: leftInset)
        
        self.stackView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.contentView).inset(containerInsets)
            make.bottom.equalTo(self.button.snp.top).offset(-containerInset)
        }
    }
    
    func configureButton() {
        self.button.backgroundColor = Colors.greenLeaf
        self.button.setTitle(Titles.Buttons.showMap, for: .normal)
        self.button.titleLabel?.font = Fonts.roboto(type: .medium, size: 14.0)
        self.button.setTitleColor(.white, for: .normal)
        
        self.button.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        
        self.contentView.add(self.button)
        
        self.button.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(buttonHeight)
        }
    }
    
    @objc func buttonPressed() {
        print("Button tapped")
    }
}
