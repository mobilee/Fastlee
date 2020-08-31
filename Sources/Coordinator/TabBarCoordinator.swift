//
//  TabBarCoordinator.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

open class TabBarCoordinator: Coordinator, UITabBarControllerDelegate {

    public var tabController: UITabBarController

    public var viewControllers: [UIViewController] {
        return self.childCoordinators.compactMap { $0.presentableViewController() }
    }

    override public convenience init() {
        let tab = UITabBarController()
        self.init(tabController: tab)
    }

    public init(tabController: UITabBarController) {

        self.tabController = tabController
        super.init()
        self.tabController.delegate = self
    }
    
    open override func presentableViewController() -> UIViewController {
        return tabController
    }
}
