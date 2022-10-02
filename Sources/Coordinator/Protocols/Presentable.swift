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
    
}

public protocol ModalPresenter {
    func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)?)
}

public protocol NavigationPresenter {
    func push(_ presentable: Presentable, animated: Bool)
    func pop(_ animated: Bool)
    func popToRoot(_ animated: Bool)
}

extension UIViewController: Presentable, ModalPresenter {
    public func presentableViewController() -> UIViewController {
        return self
    }
    
    public func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.present(presentable.presentableViewController(), animated: animated, completion: completion)
        }
    }
}

extension Coordinator: Presentable, ModalPresenter {
    public func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)? = nil) {
        if (presentable is UIAlertController) == true {
            self.presentableViewController().present(presentable, animated: animated, completion: completion)
        } else {
            if let coord = presentable as? Coordinator {
                addCoordinator(coord)
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

extension NavigationCoordinator: NavigationPresenter {
    public func push(_ presentable: Presentable, animated: Bool) {
        let view = presentable.presentableViewController()
        guard view is UINavigationController == false else {
            print("Push UINavigationController on UINavigationController is not allowed")
            return
        }
        
        DispatchQueue.main.async {
            self.navigationController.pushViewController(view, animated: animated)
        }
    }
    
    public func pop(_ animated: Bool) {
        DispatchQueue.main.async {
            self.navigationController.popViewController(animated: animated)
        }
    }
    
    public func popToRoot(_ animated: Bool) {
        DispatchQueue.main.async {
            if let vc = self.initialViewController {
                self.navigationController.popToViewController(vc, animated: true)
            } else {
                self.navigationController.popToRootViewController(animated: animated)
            }
        }
    }
}
