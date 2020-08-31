//
//  UIColor+Adjust.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public extension UIColor {

    /**
     Create a lighter color

     - parameter percentage: factor used for calulation lighter color. Value can be from 0 to 100 (value in %)

     - returns: Brighter UIColor value

     - Author: Mobilee - Łukasz Szarkowicz
     */
    func lighter(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjustBrightness(by: abs(percentage))
    }

    /**
     Create a darker color

     - parameter percentage: factor used for calulation darker color. Value can be from 0 to 100 (value in %)

     - returns: Darker UIColor value

     - Author: Mobilee - Łukasz Szarkowicz
     */
    func darker(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjustBrightness(by: -abs(percentage))
    }

    /**
     Try to increase or decrease lightness and saturation

     - parameter percentage: factor used for calulation lighter color. Value can be from -100 to 100 (value in %)

     - returns: Brighter UIColor value

     - Author: Mobilee - Łukasz Szarkowicz
     */

    func adjustBrightness(by percentage: CGFloat = 30.0) -> UIColor {

        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {

            let pFactor = (100.0 + percentage) / 100.0

            let newRed = (red * pFactor).clamped(to: 0.0...1.0)
            let newGreen = (green * pFactor).clamped(to: 0.0...1.0)
            let newBlue = (blue * pFactor).clamped(to: 0.0...1.0)

            return UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: alpha)
        }

        return self
    }
}

