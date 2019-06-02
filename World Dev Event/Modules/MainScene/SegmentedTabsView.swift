//
//  SegmentedTabsView.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

private let bottomBarHeight: CGFloat = 2
private let viewHeight: CGFloat = 42
private let fontSize: CGFloat = 14.0

class SegmentedTabsView: UIView {
    private let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.backgroundColor = Colors.orange
        control.tintColor = .white
        
        Fonts.roboto(type: .medium, size: fontSize)
            .map {
                //        control.setTitleTextAttributes([.font: font, .foregroundColor: Colors.navy], for: .selected)
                control.setTitleTextAttributes([.font: $0, .foregroundColor: UIColor.white], for: .normal)
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
    
    var viewHeight: CGFloat = 48.0
    
    convenience init(titles: [String]) {
        self.init()
        self.items = titles
        self.setupSegmentItems()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        self.segmentedControl.addTarget(self, action: #selector(self.segmentedItemChanged(_:)), for: .valueChanged)
        self.add(self.segmentedControl, self.bottomBarView)
        self.describeSubviewsLayout()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.
//        self.snp.makeConstraints { make in
//            make.height.equalTo(viewHeight)
//        }
    }
}

private extension SegmentedTabsView {
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
        self.animateBottomBarView()
        self.didSelectItemAtIndexAction?(sender.selectedSegmentIndex)
    }
    
    func animateBottomBarView() {
        let control = self.segmentedControl
        
        UIView.animate(withDuration: 0.3) {
            self.bottomBarView.frame.origin.x = (control.frame.width / CGFloat(control.numberOfSegments)) * CGFloat(control.selectedSegmentIndex)
        }
    }
}
