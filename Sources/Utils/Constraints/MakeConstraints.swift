//
//  MakeConstraints.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 03/07/2023.
//  Copyright © 2023 Mobilee. All rights reserved.
//

import UIKit

public extension UIView {
    
    func constraintsEqual(to view: UIView, insets: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        guardDescendantHierarchy(of: view)
        
        return [
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right)
        ]
    }
    
    func constraintsEqual(to layoutGuide: UILayoutGuide, insets: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        guardDescendantHierarchy(of: layoutGuide.owningView)
        
        return [
            topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top),
            leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: insets.left),
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -insets.bottom),
            trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -insets.right)
        ]
    }
    
    func constraintsTo(width: NSLayoutDimension? = nil,
                       widthMultiplier: CGFloat = 1.0,
                       height: NSLayoutDimension? = nil,
                       heightMultiplier: CGFloat = 1.0) -> [NSLayoutConstraint] {
        
        let widthConstr = width.map { widthAnchor.constraint(equalTo: $0, multiplier: widthMultiplier) }
        let heightConstr = height.map { heightAnchor.constraint(equalTo: $0, multiplier: heightMultiplier) }
        
        return [widthConstr, heightConstr].compactMap { $0 }
    }
    
    func aspectRatioConstraint(multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        return widthAnchor.constraint(equalTo: heightAnchor,
                                      multiplier: multiplier,
                                      constant: constant)
    }
    
    func heightConstraintEqual(to view: UIView, multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> NSLayoutConstraint {
        return heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier, constant: constant)
    }
    
    func widthConstraintEqual(to view: UIView, multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> NSLayoutConstraint {
        return widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier, constant: constant)
    }
    
    func centerXConstraintEqual(to view: UIView, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        return centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant)
    }
    
    func centerYConstraintEqual(to view: UIView, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        return centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant)
    }
    
    func centerXYConstraintsEqual(to view: UIView) -> [NSLayoutConstraint] {
        return centerXConstraintEqual(to: view) + centerYConstraintEqual(to: view)
    }
    
    func constraints(top: NSLayoutYAxisAnchor? = nil,
                     left: NSLayoutXAxisAnchor? = nil,
                     bottom: NSLayoutYAxisAnchor? = nil,
                     right: NSLayoutXAxisAnchor? = nil,
                     paddingTop: CGFloat = 0,
                     paddingLeft: CGFloat = 0,
                     paddingBottom: CGFloat = 0,
                     paddingRight: CGFloat = 0,
                     width: CGFloat? = nil,
                     height: CGFloat? = nil) -> [NSLayoutConstraint] {
        
        return [
            top.map { topAnchor.constraint(equalTo: $0, constant: paddingTop) },
            left.map { leftAnchor.constraint(equalTo: $0, constant: paddingLeft) },
            bottom.map { bottomAnchor.constraint(equalTo: $0, constant: -paddingBottom) },
            right.map { rightAnchor.constraint(equalTo: $0, constant: -paddingRight) },
            width.map { widthAnchor.constraint(equalToConstant: $0) },
            height.map { heightAnchor.constraint(equalToConstant: $0) }
        ].compactMap { $0 }
    }
    
}


