//
//  Coordinable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public protocol Coordinable: AnyObject, Presentable, Dismissable {
    var rootViewController: UIViewController? { get }
    var childCoordinators: [Coordinable] { get }
    func start()
}
