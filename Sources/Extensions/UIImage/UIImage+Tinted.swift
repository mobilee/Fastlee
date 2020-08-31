//
//  UIImage+Tinted.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public extension UIImage {

    /**
     Creates tinted image.

     You can use alpha component in provided UIColor, then picture will be partly covered with this color.

     - parameter color: Color used for creating tinted image

     - returns: New image covered with given color

     - Author: Mobilee - Łukasz Szarkowicz
     */
    func tinted(color: UIColor) -> UIImage? {
        let image = self
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: image.size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, image.scale)
        let context = UIGraphicsGetCurrentContext()!
        image.draw(in: rect)
        context.setFillColor(color.cgColor)
        context.setBlendMode(.sourceAtop)
        context.fill(rect)
        if let result = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return result
        } else {
            return self
        }
    }
}
