//
//  Coordinator.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

// MARK: - Module Coordinator -
protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    
    func start()
    
    func set(rootView: UIViewController, _ completion: (() -> Void)?)
    func push(view: UIViewController, _ completion: (() -> Void)?)
    func present(view: UIViewController, _ completion: (() -> Void)?)
    func dismissView(animated: Bool, _ completion: (() -> Void)?)
    func popView(animated: Bool)
}

extension Coordinator {
    func set(rootView: UIViewController, _ completion: (() -> Void)? = nil) {
        onMainQueue {
            self.navigationController.setViewControllers([rootView], animated: true)
            completion?()
        }
    }
    
    func push(view: UIViewController, _ completion: (() -> Void)? = nil) {
        onMainQueue {
            self.navigationController.pushViewController(view, animated: true)
            completion?()
        }
    }
    
    func present(view: UIViewController, _ completion: (() -> Void)? = nil) {
        onMainQueue {
            self.navigationController.present(view, animated: true, completion: completion)
        }
    }
    
    func dismissView(animated: Bool, _ completion: (() -> Void)? = nil) {
        onMainQueue {
            self.navigationController.dismiss(animated: animated, completion: completion)
        }
    }
    
    func popView(animated: Bool) {
        onMainQueue {
            self.navigationController.popViewController(animated: animated)
        }
    }
}
