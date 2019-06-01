//
//  MapViewController.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

protocol MapViewContract: AnyObject {
    
}

final class MapViewController: BaseViewController {
    var presenter: MapPresenterContract!
    
    func bind(presenter: MapPresenterContract) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.onViewDidLoad()
    }
}

extension MapViewController: MapViewContract {
    
}
