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
    
    func showAlert(text: String,
                   defaultButtonTitle: String,
                   cancelButtonTitle: String?,
                   completion: ((BaseViewController.AlertAction) -> Void)?) {
        onMainQueue {
            let alertController = UIAlertController(title: text, message: nil, preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: defaultButtonTitle, style: .default)  { _ in
                completion?(.defaultPressed)
            })
            
            if cancelButtonTitle != nil {
                alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
                    completion?(.cancelPressed)
                })
            }
            
            self.present(alertController, animated: true)
        }
    }
}

private extension BaseViewController {
    func configureView() {
        self.view.backgroundColor = .white
    }
}

extension BaseViewController {
    enum AlertAction {
        case defaultPressed
        case cancelPressed
    }
}
