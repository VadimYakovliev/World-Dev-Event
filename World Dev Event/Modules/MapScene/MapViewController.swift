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
    func update(presentationModel: Activity)
}

final class MapViewController: BaseViewController {
    var presenter: MapPresenterContract!
    
    private let mapView = MKMapView()
    
    func bind(presenter: MapPresenterContract) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.onViewDidLoad()
    }
}

extension MapViewController: MapViewContract {
    func update(presentationModel: Activity) {
        
    }
}
