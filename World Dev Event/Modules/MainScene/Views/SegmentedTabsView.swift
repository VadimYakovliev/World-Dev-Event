//
//  SegmentedTabsView.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit
import SnapKit

private let bottomBarHeight: CGFloat = 2
private let fontSize: CGFloat = 14.0
private let textAlpha: CGFloat = 0.5
private let textColor = UIColor.white
private let tabAnimationDuration: TimeInterval = 0.25

class SegmentedTabsView: UIView {
    private let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.backgroundColor = Colors.orange
        let tintColor = Colors.orange
        
        if #available(iOS 13.0, *) {
            control.selectedSegmentTintColor = tintColor
        } else {
            control.tintColor = tintColor
        }
        
        Fonts.roboto(type: .medium, size: fontSize).map {
            control.setTitleTextAttributes([.font: $0,
                                            .foregroundColor: textColor],
                                           for: .selected)
            control.setTitleTextAttributes([.font: $0,
                                            .foregroundColor: textColor.withAlphaComponent(textAlpha)],
                                           for: .normal)
        }

        return control
    }()
    
    private let bottomBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var didSelectItemAtIndexAction: ((Int) -> Void)?
    
    private var items = [String]()
    
    convenience init(titles: [String]) {
        self.init()
        self.items = titles
        self.setupSegmentItems()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        self.configure()
        self.add(self.segmentedControl, self.bottomBarView)
        self.describeSubviewsLayout()
    }
}

private extension SegmentedTabsView {
    func configure() {
        self.backgroundColor = Colors.orange
        self.layer.shadow(color: .black)
    
        self.segmentedControl.addTarget(self,
                                        action: #selector(self.segmentedItemChanged(_:)),
                                        for: .valueChanged)
    }
    
    func describeSubviewsLayout() {
        self.segmentedControl.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-bottomBarHeight)
        }
        
        self.bottomBarView.snp.makeConstraints { make in
            make.height.equalTo(bottomBarHeight)
            make.top.equalTo(self.segmentedControl.snp.bottom)
            make.left.equalTo(self.segmentedControl.snp.left)
            make.width.equalTo(self.segmentedControl.snp.width).dividedBy(self.segmentedControl.numberOfSegments)
        }
    }
    
    func setupSegmentItems() {
        self.items.enumerated().forEach { index, item in
            self.segmentedControl.insertSegment(withTitle: item, at: index, animated: true)
        }
        
        self.segmentedControl.selectedSegmentIndex = .zero
    }
    
    @objc func segmentedItemChanged(_ sender: UISegmentedControl) {
        self.animateBottomBarView(control: sender)
        self.didSelectItemAtIndexAction?(sender.selectedSegmentIndex)
    }
    
    func animateBottomBarView(control: UISegmentedControl) {
        UIView.animate(withDuration: tabAnimationDuration) {
            self.bottomBarView.frame.origin.x = (control.frame.width / CGFloat(control.numberOfSegments)) * CGFloat(control.selectedSegmentIndex)
        }
    }
}
