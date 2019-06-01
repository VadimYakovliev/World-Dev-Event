//
//  DetailsViewController.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

protocol DetailsViewContract: AnyObject {
    
}

final class DetailsViewController: BaseViewController {
    var presenter: DetailsPresenterContract!
    
    func bind(presenter: DetailsPresenterContract) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.onViewDidLoad()
    }
}

extension DetailsViewController: DetailsViewContract {
    
}
