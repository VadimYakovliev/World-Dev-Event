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
    typealias DetailsSceneParameters = (presentationModel: Activity, selectListener: ((Activity) -> Void)?)
    
    enum SceneType {
        case activities(ActivitiesSceneParameters)
        case details(DetailsSceneParameters)
        case map(Activity)
    }
    
    static func make(type: SceneType) -> UIViewController {
        switch type {
        case .activities(let parameters):
            return self.makeActivitiesScene(parameters: parameters)
        case .details(let parameters):
            return self.makeDetailsScene(parameters: parameters)
        case .map(let activity):
            return self.makeMapScene(activity: activity)
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
        
        let presenter = DetailsPresenter(view: view, presentationModel: parameters.presentationModel)
        view.bind(presenter: presenter)
        
        presenter.onButtonPressedListener = parameters.selectListener
        
        return view
    }
    
    private static func makeMapScene(activity: Activity) -> UIViewController {
        let view = MapViewController()
        
        let presenter = MapPresenter(view: view, activity: activity)
        view.bind(presenter: presenter)
        
        return view
    }
}
