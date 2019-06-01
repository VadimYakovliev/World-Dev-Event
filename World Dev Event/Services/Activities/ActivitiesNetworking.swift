//
//  ActivitiesNetworking.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Networking

protocol ActivitiesNetworkingContract {
    func receiveData(_ handler: @escaping Handler<[SimpleActivity]>)
}

final class ActivitiesNetworking {
    private let networking: NetworkingContract
    
    init(networking: NetworkingContract = Networking()) {
        self.networking = networking
    }
}

extension ActivitiesNetworking: ActivitiesNetworkingContract {
    func receiveData(_ handler: @escaping Handler<[SimpleActivity]>) {
        self.networking.execute(type: .GET,
                                urlString: API.activities,
                                authorizationType: .none,
                                httpBody: nil) { [weak self] result in
                                    
                                    switch result {
                                    case .success(let data):
                                        self?.handle(data: data, handler: handler)
                                    case .failure(let error):
                                        handler(.failure(error))
                                    }
        }
    }
}

private extension ActivitiesNetworking {
    func handle(data: Data?, handler: Handler<[SimpleActivity]>) {
        guard
            let activities: [SimpleActivity] = data?.decoded()
            else { handler(.failure(NetworkErrors.undefined)); return }
        
        handler(.success(activities))
    }
}
