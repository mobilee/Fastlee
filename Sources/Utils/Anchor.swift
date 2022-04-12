//
//  Anchor.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 12/04/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public extension UIView {
    
    func anchor(to parentView: UIView, insets: UIEdgeInsets = .zero) {
        guard parentView == self.superview else {
            logError(message: "No parent view for creating constraints. Use addSubview(:) to add child view firstly.")
            return }
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parentView.topAnchor, constant: insets.top),
            leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: insets.left),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -insets.bottom),
            rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -insets.right)
        ])
    }
    
    func anchor(to layoutGuide: UILayoutGuide, insets: UIEdgeInsets = .zero) {
        guard layoutGuide.owningView == self.superview else {
            logError(message: "No parent view for creating constraints. Use addSubview(:) to add child view firstly.")
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top),
            leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: insets.left),
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -(insets.bottom)),
            rightAnchor.constraint(equalTo: layoutGuide.rightAnchor, constant: -(insets.right))
        ])
    }
    
    func anchor(width: NSLayoutDimension? = nil,
                height: NSLayoutDimension? = nil) {
        
        guard width != nil || height != nil else {
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        if let width = width {
            widthAnchor.constraint(equalTo: width, multiplier: 1.0).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalTo: height, multiplier: 1.0).isActive = true
        }
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func anchorCenterX(to parentView: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: parentView.centerXAnchor, constant: constant).isActive = true
    }
    
    func anchorCenterY(to parentView: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: constant).isActive = true
    }
    
    func anchorCenterXY(to parentView: UIView) {
        anchorCenterX(to: parentView)
        anchorCenterY(to: parentView)
    }
    
    func anchorWidth(to parentView: UIView, multiplier: CGFloat = 0, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: parentView.widthAnchor, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func anchorHeight(to parentView: UIView, multiplier: CGFloat = 0, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: parentView.heightAnchor, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func anchorAspectRatio(multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: multiplier, constant: constant).isActive = true
    }
}
