//
//  MakeConstraints+Activate.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 04/07/2023.
//  Copyright © 2023 Mobilee. All rights reserved.
//

import UIKit

public extension Array where Element: NSLayoutConstraint {
    func activateAll(turnOffAutoresizingMask: Bool = true) {
        NSLayoutConstraint.activate(self)
        
        if turnOffAutoresizingMask {
            self.compactMap { constr in
                
                constr.firstItem as? UIView ?? constr.secondItem as? UIView
            }.forEach { view in
                view.translatesAutoresizingMaskIntoConstraints = false
            }
        }
    }
    
    static func +(lhs: [NSLayoutConstraint], rhs: NSLayoutConstraint) -> [NSLayoutConstraint] {
        var result = lhs
        result.append(rhs)
        return result
    }
    
    static func +(lhs: NSLayoutConstraint, rhs: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        var result = rhs
        result.append(lhs)
        return result
    }
}

extension NSLayoutConstraint {
    static func +(lhs: NSLayoutConstraint, rhs: NSLayoutConstraint) -> [NSLayoutConstraint] {
        return [lhs, rhs]
    }
}
