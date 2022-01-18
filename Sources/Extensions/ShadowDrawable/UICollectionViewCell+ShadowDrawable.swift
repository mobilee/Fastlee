//
//  UICollectionViewCell+ShadowDrawable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 16/09/2021.
//  Copyright © 2021 Mobilee. All rights reserved.
//

import UIKit

public extension ShadowDrawable where Self: UICollectionViewCell {
    func drawShadow(with color: UIColor, opacity: Float, radius: CGFloat) {
        let cornerRadius = layer.cornerRadius
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: -2.0, height: -2.0)
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
        layer.shadowPath = path.cgPath
    }
}
