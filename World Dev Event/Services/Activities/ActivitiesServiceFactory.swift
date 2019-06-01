//
//  ActivitiesServiceFactory.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Networking

typealias NetworkingService = NetworkingContract
typealias NetworkingError = NetworkErrors

enum ActivitiesServiceFactory {
    static func makeRepository() -> ActivitiesRepositoryContract {
        let networking: NetworkingService = Networking()
        let activitiesNetworking: ActivitiesNetworkingContract = ActivitiesNetworking(networking: networking)
        let repository: ActivitiesRepositoryContract = ActivitiesRepository(activitiesNetworking: activitiesNetworking)
        
        return repository
    }
}
