//
//  MainCoordinator.swift
//  Example
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import Foundation
import Fastlee

class MainCoordinator: AppCoordinator {

    override func start() {
        let coord = HomeCoordinator()
        
        add(coordinator: coord)
        setRoot(coord)
    }
}
