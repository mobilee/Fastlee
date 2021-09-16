//
//  UILabel+ShadowDrawable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 16/09/2021.
//  Copyright © 2021 Mobilee. All rights reserved.
//

import UIKit

extension ShadowDrawable where Self: UILabel {
    func drawShadow(with color: UIColor, opacity: Float, radius: CGFloat) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.masksToBounds = false
    }
}
