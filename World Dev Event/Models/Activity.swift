//
//  Activity.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

final class Activity {
    let title: String
    let preview: PreviewActivity
    let details: DetailsActivity
    
    init(simpleActivity: SimpleActivity) {
        self.title = simpleActivity.title
        
        self.preview = PreviewActivity(previewImageURL: simpleActivity.previewImageURL,
                                       shortDescription: simpleActivity.shortDescription)
        
        self.details = DetailsActivity(fullImageURL: simpleActivity.fullImageURL,
                                       fullDescription: simpleActivity.fullDescription,
                                       latitude: simpleActivity.latitude,
                                       longitude: simpleActivity.longitude)
    }
    
    class PreviewActivity {
        let description: String
        let imageURL: URL?
        
        init(previewImageURL: String, shortDescription: String) {
            self.description = shortDescription
            self.imageURL = URL(string: previewImageURL)
        }
    }
    
    class DetailsActivity {
        let description: String
        let imageURL: URL?
        let coordinates: Coordinates
        
        init(fullImageURL: String, fullDescription: String, latitude: String, longitude: String) {
            self.description = fullDescription
            self.imageURL = URL(string: fullImageURL)
            self.coordinates = Coordinates(latitude: latitude, longitude: longitude)
        }
    }
}
