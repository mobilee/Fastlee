//
//  HorizontalSubNaviCoordinator.swift
//  Example
//
//  Created by Łukasz Szarkowicz on 13/09/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

class HorizontalSubNaviCoordinator: NavigationCoordinator {
    
    override func start() {
        let vc = BlueViewController()
        vc.coordinator = self
        push(vc, animated: true)
    }
}

extension HorizontalSubNaviCoordinator: BlueNavigation {
    func openGreenView(from viewController: UIViewController) {
        let vc = GreenViewController()
        vc.coordinator = self
        push(vc, animated: true)
    }
}

extension HorizontalSubNaviCoordinator: GreenNavigation {
    func selectEndProcess(from viewController: UIViewController) {
        popToRoot(true)
    }
}
