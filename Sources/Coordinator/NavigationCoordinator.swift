//
//  NavigationCoordinator.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

//extension Array where Element: Equatable {
//
//    func nextAfter(_ element: Element) -> Element? {
//        guard let index = firstIndex(of: element) else { return nil }
//        let nextIndex = index.advanced(by: 1)
//
//        return self[safe: nextIndex]
//    }
//}

open class NavigationCoordinator: Coordinator, UINavigationControllerDelegate {

    deinit {
        // IMPORTANT: During deinit() all viewControllers should be removed from navigationController to avoid retain cycle.
        if initialViewController == nil {
            navigationController.setViewControllers([], animated: false)
            navigationController = nil
        }
    }
    
    public override func presentableViewController() -> UIViewController {
        return navigationController
    }
    
    public override var rootViewController: UIViewController? {
        return navigationController
    }
    
    public var initialViewController: UIViewController?
    
    public var firstViewController: UIViewController? {
        guard let initialViewController = initialViewController else {
            return navigationController.viewControllers.first
        }
        
        let vc = navigationController.viewControllers.nextAfter(initialViewController)
        return vc ?? navigationController.viewControllers.first
    }

    public var navigationController: UINavigationController!
    
    private var childNavigationCoordinators: [NavigationCoordinator] {
        return childCoordinators.filter({ $0 is NavigationCoordinator }) as! [NavigationCoordinator]
    }

    public init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        super.init()
        self.initialViewController = navigationController.viewControllers.last
        
        if self.initialViewController == nil {
            navigationController.delegate = self
        }
    }
    

    
    
    
    public func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        removeAllChildCoordinators()
        navigationController.setViewControllers(viewControllers, animated: animated)
    }
    
    open override func end() {
        if let viewController = initialViewController {
            navigationController.popToViewController(viewController, animated: true)
        } else {
            navigationController.popToRootViewController(animated: true)
            
        }
        super.end()
    }
    
    // MARK: - UINavigationControllerDelegate
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        for child in childNavigationCoordinators {
            child.navigationController(navigationController, didShow: viewController, animated: animated)
        }
        
        if viewController === initialViewController {
            didFinish?(self)
        }
    }
}
