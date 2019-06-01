//
//  Activity.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

// MARK: - Activity -> Event or Shop

struct Activity: Equatable {
    let id: Int
    let type: ActivityType
    
    let title, shortDescription, fullDescription: String
    
    let previewImageURL, fullImageURL: String
    let latitude, longitude: String
    
    enum ActivityType: String, Decodable {
        case event = "event"
        case shop = "shop"
    }
}

extension Activity: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, type, title, shortDescription
        
        case fullDescription = "description"
        case previewImageURL = "smallImage"
        case fullImageURL = "bigImage"
        
        case latitude, longitude
    }
}
