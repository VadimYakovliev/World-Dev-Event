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
    private let activity: Activity
    
    init(view: MapViewContract, activity: Activity) {
        self.view = view
        self.activity = activity
    }
}

extension MapPresenter: MapPresenterContract {
    func onViewDidLoad() {
        let mapPresentationModel = MapPresentationModel(activityTitle: self.activity.title,
                                                        coordinates: self.activity.details.coordinates)
        self.view.update(presentationModel: mapPresentationModel)
    }
}
