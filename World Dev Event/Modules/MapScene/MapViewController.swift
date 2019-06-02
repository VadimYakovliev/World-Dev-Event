//
//  MapViewController.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit
import MapKit

private let regionRadius: CLLocationDistance = 3000

protocol MapViewContract: AnyObject {
    func update(presentationModel: MapPresentationModel)
}

final class MapViewController: BaseViewController {
    var presenter: MapPresenterContract!
    
    private let mapView = MKMapView()
    
    func bind(presenter: MapPresenterContract) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.add(self.mapView)
        self.mapView.equalSizeToSuperview()
        self.presenter.onViewDidLoad()
    }
}

extension MapViewController: MapViewContract {
    func update(presentationModel: MapPresentationModel) {
        onMainQueue {
            let coordinates = presentationModel.activityCoordinates
            let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
            self.configureMap(location: location)
            self.mapView.addAnnotation(presentationModel)
        }
    }
}

private extension MapViewController {
    func configureMap(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }
}
