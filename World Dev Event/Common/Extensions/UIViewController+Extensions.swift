//
//  UIViewController+Extensions.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(message: String,
                   title: String? = nil,
                   defaultButtonTitle: String,
                   cancelButtonTitle: String? = nil,
                   completion: ((Bool) -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: defaultButtonTitle, style: .default, handler: { _ in
            completion?(true)
        }))
        
        if cancelButtonTitle != nil {
            alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: { _ in
                completion?(false)
            }))
        }
        
        self.present(alertController, animated: true)
    }
}
