//
//  DetailsPresenter.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

protocol DetailsPresenterContract: BasePresenterContract {
    func onShowMapDidPressed(withCoordinates coordinates: Coordinates)
}

final class DetailsPresenter {
    unowned var view: DetailsViewContract
    let presentationModel: Activity
    
    var onButtonPressedListener: ((Coordinates) -> Void)?
    
    init(view: DetailsViewContract, presentationModel: Activity) {
        self.view = view
        self.presentationModel = presentationModel
    }
}

extension DetailsPresenter: DetailsPresenterContract {
    func onViewDidLoad() {
        self.view.update(withModel: DetailsTableViewModel(activity: self.presentationModel))
    }
    
    func onShowMapDidPressed(withCoordinates coordinates: Coordinates) {
        self.onButtonPressedListener?(coordinates)
    }
}
