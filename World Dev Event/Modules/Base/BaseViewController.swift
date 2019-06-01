//
//  ViewController.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.configureView()
    }
}

private extension BaseViewController {
    func configureView() {
        self.view.backgroundColor = .white
    }
}

extension BaseViewController: DefaultAlert {
    enum AlertAction {
        case defaultPressed
        case cancelPressed
    }
}

// MARK: - Alert view

protocol DefaultAlert {
    func showAlert(text: String,
                   defaultButtonTitle: String,
                   cancelButtonTitle: String?,
                   completion: ((BaseViewController.AlertAction) -> Void)?)
}

extension DefaultAlert where Self: UIViewController {
    func showAlert(text: String,
                   defaultButtonTitle: String,
                   cancelButtonTitle: String?,
                   completion: ((BaseViewController.AlertAction) -> Void)?) {
        onMainQueue {
            self.showAlert(message: text,
                           defaultButtonTitle: defaultButtonTitle,
                           cancelButtonTitle: cancelButtonTitle) { defaultPressed in
                            
                            let action: BaseViewController.AlertAction = defaultPressed
                                ? .defaultPressed
                                : .cancelPressed
                            completion?(action)
            }
        }
    }
}
