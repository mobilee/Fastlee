//
//  HomeCoordinator.swift
//  Example
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

class HomeCoordinator: NavigationCoordinator {
    
    override func start() {
        let view = HomeModule.build(for: self)
        setViewControllers([view], animated: false)
    }
}

extension HomeCoordinator: HomeRouter {
    func openNibLoadExample(from viewController: UIViewController) {
        let view = LoadNibExampleModule.build(for: self)
        push(view, animated: true)
    }
    
    func openReusableCellsExample(from viewController: UIViewController) {
        let view = ReusableCellsExampleViewController.instantiate()
        push(view, animated: true)
    }
}

extension HomeCoordinator: LoadNibExampleRouter {
    
}
