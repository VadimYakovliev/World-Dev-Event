//
//  AppConfigurator.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

// MARK: - Service to configure starting state

final class AppConfigurator {
    var appCoordinator: AppCoordinator?
    
    init?(window: UIWindow?) {
        guard let window = window else {
            return nil
        }
        
        self.configure(window: window)
    }
    
    private func configure(window: UIWindow) {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        
        self.appCoordinator = AppCoordinator(navigationController: navigationController,
                                             activitiesRepository: ActivitiesServiceFactory.makeRepository())
        
        self.configureAppearance()
        self.appCoordinator?.start()
        
        window.makeKeyAndVisible()
    }
    
    private func configureAppearance() {
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = Colors.orange
        appearance.tintColor = .white
        appearance.isTranslucent = false
        appearance.shadowImage = UIImage()
        
        Fonts.roboto(type: .medium, size: 20.0)
            .map { appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: $0] }
    }
}
