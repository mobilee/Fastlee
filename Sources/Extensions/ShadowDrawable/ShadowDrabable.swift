//
//  ShadowDrabable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 16/09/2021.
//  Copyright © 2021 Mobilee. All rights reserved.
//

import UIKit

public protocol ShadowDrawable {
    /**
     Draw shadow to element.
     
     - parameter color: Shadow's color
     
     - parameter opacity: Opacity of shadow. Value between 0.0 and 1.0
     
     - parameter radius: Blur radius of shadow. Bigger value means bigger blur for shadow.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func drawShadow(with color: UIColor, opacity: Float, radius: CGFloat)
}
