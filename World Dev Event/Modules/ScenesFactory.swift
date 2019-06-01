//
//  ScenesFactory.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

enum ScenesFactory {
    typealias ActivitiesSceneParameters = (repository: ActivitiesRepositoryContract, selectListener: ((Activity) -> Void)?)
    typealias DetailsSceneParameters = (presentationModel: Activity, selectListener: ((Coordinates) -> Void)?)
    
    enum SceneType {
        case activities(ActivitiesSceneParameters)
        case details(DetailsSceneParameters)
        case map(Coordinates)
    }
    
    static func make(type: SceneType) -> UIViewController {
        switch type {
        case .activities(let parameters):
            return self.makeActivitiesScene(parameters: parameters)
        case .details(let parameters):
            return self.makeDetailsScene(parameters: parameters)
        case .map(let coordinates):
            return self.makeMapScene(coordinates: coordinates)
        }
    }
    
    private static func makeActivitiesScene(parameters: ActivitiesSceneParameters) -> UIViewController {
        let view = ActivitiesViewController()
        view.title = Titles.Screens.activities
        
        let presenter = ActivitiesPresenter(view: view, repository: parameters.repository)
        view.bind(presenter: presenter)
        
        presenter.onActivitySelectListener = parameters.selectListener
        
        return view
    }
    
    private static func makeDetailsScene(parameters: DetailsSceneParameters) -> UIViewController {
        let view = DetailsViewController()
        
        let presenter = DetailsPresenter(view: view)
        view.bind(presenter: presenter)
        
        return view
    }
    
    private static func makeMapScene(coordinates: Coordinates) -> UIViewController {
        let view = MapViewController()
        
        let presenter = MapPresenter(view: view)
        view.bind(presenter: presenter)
        
        return view
    }
}
