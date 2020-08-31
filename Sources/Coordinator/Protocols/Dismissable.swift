//
//  Dismissable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public protocol Dismissable {
    
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension UIViewController: Dismissable {}

extension Coordinator: Dismissable {
    
    public func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
        
        /// Safe guard -- dismiss should happend just in case presentedViewController or presentingViewController exists.
        
        if presentableViewController().presentedViewController != nil {
            // It's case when any VC is presented in current context.
            DispatchQueue.main.async {
                self.presentableViewController().dismiss(animated: animated, completion: completion)
            }
        } else if presentableViewController().presentingViewController != nil {
            // It's case when this coordinator is presented by other VC.
            DispatchQueue.main.async {
                self.presentableViewController().dismiss(animated: animated, completion: { [weak self] in
                    guard let `self` = self else { return }
                    
                    completion?()
                    self.end()
                })
            }
        }
    }
}
