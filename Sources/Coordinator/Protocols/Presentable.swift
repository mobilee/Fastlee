//
//  Presentable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public protocol Presentable {
    func presentableViewController() -> UIViewController
    func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)?)
}

extension UIViewController: Presentable {
    public func presentableViewController() -> UIViewController {
        return self
    }
    
    public func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.present(presentable.presentableViewController(), animated: animated, completion: completion)
        }
    }
}

extension Coordinator: Presentable {
    public func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)? = nil) {
        if (presentable is UIAlertController) == true {
            self.presentableViewController().present(presentable, animated: animated, completion: completion)
        } else {
            if let coord = presentable as? Coordinator {
                add(coordinator: coord)
            }
            
            DispatchQueue.main.async {
                let toPresent = presentable.presentableViewController()
                // IMPORTANT: set delegate here to avoid retain cycle. If you set delegate in Coordinator's init() and you create this coordinator without executing presentation on it, there is created retain cycle.
                toPresent.presentationController?.delegate = presentable as? Coordinator
                self.presentableViewController().present(toPresent, animated: animated, completion: completion)
            }
        }
    }
}
