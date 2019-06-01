//
//  ActivitiesViewController.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

protocol ActivitiesViewContract: AnyObject {
    func update(activities: [Activity])
    
    func showAlert(text: String,
                   defaultButtonTitle: String,
                   cancelButtonTitle: String?,
                   completion: ((BaseViewController.AlertAction) -> Void)?)
}

final class ActivitiesViewController: BaseViewController {
    var presenter: ActivitiesPresenterContract!
    
    func bind(presenter: ActivitiesPresenterContract) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.onViewDidLoad()
    }
}

extension ActivitiesViewController: ActivitiesViewContract {
    func update(activities: [Activity]) {
        print(#function, activities)
    }
}
