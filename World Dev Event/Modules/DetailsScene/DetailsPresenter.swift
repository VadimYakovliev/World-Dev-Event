//
//  DetailsPresenter.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

protocol DetailsPresenterContract: BasePresenterContract {
    
}

final class DetailsPresenter {
    unowned var view: DetailsViewContract
    
    init(view: DetailsViewContract) {
        self.view = view
    }
}

extension DetailsPresenter: DetailsPresenterContract {
    func onViewDidLoad() {
        
    }
}
