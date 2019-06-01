//
//  AppCoordinator.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

final class AppCoordinator {
    let navigationController: UINavigationController
    let activitiesRepository: ActivitiesRepositoryContract
    
    init(navigationController: UINavigationController,
         activitiesRepository: ActivitiesRepositoryContract) {
        
        self.navigationController = navigationController
        self.activitiesRepository = activitiesRepository
    }
}

extension AppCoordinator: Coordinator {
    func start() {
        self.showMainScene()
    }
}

private extension AppCoordinator {
    func showMainScene() {
        let onActivitySelectListener: ((Activity) -> Void)? = { [weak self] activity in
            self?.showDetailsScene(presentationModel: activity)
        }
        
        let parameters: ScenesFactory.ActivitiesSceneParameters = (self.activitiesRepository, onActivitySelectListener)
        self.set(rootView: ScenesFactory.make(type: .activities(parameters)))
    }
    
    func showDetailsScene(presentationModel: Activity) {
        let onButtonPressedListener: ((Coordinates) -> Void)? = { [weak self] coordinates in
            self?.showMapScene(coordinates: coordinates)
        }
        
        let parameters: ScenesFactory.DetailsSceneParameters = (presentationModel, onButtonPressedListener)
        self.push(view: ScenesFactory.make(type: .details(parameters)))
    }
    
    func showMapScene(coordinates: Coordinates) {
        self.push(view: ScenesFactory.make(type: .map(coordinates)))
    }
}
