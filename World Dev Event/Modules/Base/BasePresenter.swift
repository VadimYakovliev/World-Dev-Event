//
//  BasePresenter.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

protocol BasePresenterContract {
    func onViewDidLoad()
    
    func onViewWillAppear()
    func onViewDidAppear()
    
    func onViewWillDisappear()
    func onViewDidDissapear()
}

extension BasePresenterContract {
    func onViewDidLoad() {}
    
    func onViewWillAppear() {}
    func onViewDidAppear() {}
    
    func onViewWillDisappear() {}
    func onViewDidDissapear() {}
}
