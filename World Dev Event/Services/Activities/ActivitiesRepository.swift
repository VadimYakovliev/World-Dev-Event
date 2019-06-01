//
//  ActivitiesRepository.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

typealias ActivityType = SimpleActivity.ActivityType

protocol ActivitiesRepositoryContract {
    func getActivities(byType type: ActivityType, handler: @escaping Handler<[Activity]>)
}

final class ActivitiesRepository {
    private let activitiesNetworking: ActivitiesNetworkingContract
    
    private var events = [Activity]()
    private var shops = [Activity]()
    
    init(activitiesNetworking: ActivitiesNetworkingContract) {
        self.activitiesNetworking = activitiesNetworking
    }
}

extension ActivitiesRepository: ActivitiesRepositoryContract {
    func getActivities(byType type: ActivityType, handler: @escaping Handler<[Activity]>) {
        let activities = self.activities(byType: type)
        
        guard
            activities.isEmpty
            else { handler(.success(activities)); return }
        
        self.activitiesNetworking.receiveData { [weak self] result in
            switch result {
            case .success(let simpleActivities):
                self?.handle(simpleActivities: simpleActivities, type: type, handler: handler)
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}

private extension ActivitiesRepository {
    func handle(simpleActivities: [SimpleActivity],
                type: ActivityType,
                handler: @escaping Handler<[Activity]>) {
        
        simpleActivities.forEach { simpleActivity in
            switch simpleActivity.type {
            case .event:
                self.events.append(Activity(simpleActivity: simpleActivity))
            case .shop:
                self.shops.append(Activity(simpleActivity: simpleActivity))
            }
        }

        handler(.success(self.activities(byType: type)))
    }
    
    func activities(byType type: ActivityType) -> [Activity] {
        return (type == .event) ? self.events : self.shops
    }
}
