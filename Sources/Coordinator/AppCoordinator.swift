//
//  AppCoordinator.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

open class AppCoordinator: Coordinator {

    fileprivate let window: UIWindow

    // MARK: - Computed properties

    var rootVC: UIViewController? {
        return window.rootViewController
    }

    // MARK: - Init

    public init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    internal override init() {
        fatalError()
    }

    // MARK: - Flow
    public func setRoot(_ presentable: Presentable, animated: Bool = true) {
        window.rootViewController = presentable.presentableViewController()
        window.makeKeyAndVisible()

        if animated == true {
            let options: UIView.AnimationOptions = .transitionCrossDissolve
            let duration: TimeInterval = 0.3
            UIView.transition(with: window, duration: duration, options: options, animations: nil, completion: nil)
        }
    }
}
