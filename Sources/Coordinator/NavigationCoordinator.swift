//
//  NavigationCoordinator.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

open class NavigationCoordinator: Coordinator {

    deinit {
        // IMPORTANT: During deinit() all viewControllers should be removed from navigationController to avoid retain cycle.
        navigationController.setViewControllers([], animated: false)
        navigationController = nil
    }
    
    public var navigationController: UINavigationController!

    public init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        super.init()
    }
    
    public override func presentableViewController() -> UIViewController {
        return navigationController
    }
    
    public func push(_ presentable: Presentable, animated: Bool) {
        let view = presentable.presentableViewController()
        guard view is UINavigationController == false else {
            print("Push UINavigationController on UINavigationController is not allowed")
            return
        }
       
        DispatchQueue.main.async {
            self.navigationController.pushViewController(view, animated: animated)
        }
    }
    
    public func pop(_ animated: Bool) {
        DispatchQueue.main.async {
            self.navigationController.popViewController(animated: animated)
        }
    }

    public func popToRoot(_ animated: Bool) {
        DispatchQueue.main.async {
            self.navigationController.popToRootViewController(animated: animated)
        }
    }
    
    public func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        removeAllChildCoordinators()
        navigationController.setViewControllers(viewControllers, animated: animated)
    }
}
