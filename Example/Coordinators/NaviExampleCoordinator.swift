//
//  NaviExampleCoordinator.swift
//  Example
//
//  Created by Łukasz Szarkowicz on 13/09/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

class NaviExampleCoordinator: NavigationCoordinator {
    override func start() {
        let vc = RedViewController()
        vc.coordinator = self
        push(vc, animated: true)
    }
}

extension NaviExampleCoordinator: RedNavigation {
    func openBlueViewModally(from viewController: UIViewController) {
        let coord = HorizontalSubNaviCoordinator()
        present(coord, animated: true)
    }
    
    func openBlueViewWithPush(from viewController: UIViewController) {
        let coord = HorizontalSubNaviCoordinator(navigationController: navigationController)
        addCoordinator(coord)
    }

}



extension NaviExampleCoordinator {
    
    func openNewFlow() {
        let coord = HorizontalSubNaviCoordinator()
        push(coord, animated: true)
    }
}
