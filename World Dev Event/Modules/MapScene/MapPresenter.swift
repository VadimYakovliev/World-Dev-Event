//
//  MapPresenter.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

protocol MapPresenterContract: BasePresenterContract {
    
}

final class MapPresenter {
    unowned var view: MapViewContract
    
    init(view: MapViewContract) {
        self.view = view
    }
}

extension MapPresenter: MapPresenterContract {
    func onViewDidLoad() {
        
    }
}
