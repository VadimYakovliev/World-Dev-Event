//
//  MapPresentationModel.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import MapKit

class MapPresentationModel: NSObject, MKAnnotation {
    let title: String?
    
    let coordinate: CLLocationCoordinate2D
    let activityCoordinates: Coordinates
    
    init(activityTitle: String, coordinates: Coordinates) {
        self.activityCoordinates = coordinates
     
        self.title = activityTitle
        self.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude,
                                                 longitude: coordinates.longitude)
        super.init()
    }
}
