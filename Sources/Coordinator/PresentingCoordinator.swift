//
//  PresentingCoordinator.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

open class PresentingCoordinator: Coordinator {

    public var presentingViewController: UIViewController!
    
    public override func presentableViewController() -> UIViewController {
        return presentingViewController
    }
    
    public func setViewController(_ viewController: UIViewController) {
        presentingViewController = viewController
    }
}
