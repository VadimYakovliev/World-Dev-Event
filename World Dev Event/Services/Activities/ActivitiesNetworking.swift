//
//  ActivitiesNetworking.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Networking

protocol ActivitiesNetworkingContract {
    
}

final class ActivitiesNetworking {
    private let networking: NetworkingContract
    
    init(networking: NetworkingContract) {
        self.networking = networking
    }
}

extension ActivitiesNetworking: ActivitiesNetworkingContract {
    
}
