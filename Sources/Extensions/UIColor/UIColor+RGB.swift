//
//  UIColor+RGB.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public extension UIColor {

    /**
     Initialize UIColor from __R, G, B__ values provided in Integer format.

     - parameter red: Red color in range of 0 to 255

     - parameter green: Green color in range of 0 to 255

     - parameter blue: Blue color in range of 0 to 255

     - parameter alpha: Provides information about alpha of color. It's CGFloat value in range of 0.0 to 1.0

     - returns: UIColor value

     - Author: Mobilee - Łukasz Szarkowicz
     */
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        let redColor = CGFloat(red.clamped(to: 0...255)) / 255.0
        let greenColor = CGFloat(green.clamped(to: 0...255)) / 255.0
        let blueColor = CGFloat(blue.clamped(to: 0...255)) / 255.0

        self.init(red: redColor, green: greenColor, blue: blueColor, alpha: alpha)
    }
}
