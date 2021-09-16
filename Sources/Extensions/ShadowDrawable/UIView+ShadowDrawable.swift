//
//  UIView+ShadowDrawable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 16/09/2021.
//  Copyright © 2021 Mobilee. All rights reserved.
//

import UIKit

public extension ShadowDrawable where Self: UIView {
    func drawShadow(with color: UIColor, opacity: Float, radius: CGFloat = 3.0) {
        let cornerRadius = layer.cornerRadius
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = opacity
        layer.shadowPath = path.cgPath
        layer.shadowRadius = radius
    }
}

extension UIView: ShadowDrawable {}
