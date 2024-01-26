//
//  UIColor+Image.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 04/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
public extension UIColor {
    // Create UIImage from color.
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
