//
//  Gradient.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public extension CALayer {

    /**
     Describes direction of gradient.

     - case vertical: Creates vertical aligned gradient
     - case horizontal: Creates horizontal aligned gradient
     - case custom(,): Creates custom aligned gradient, by providing start and end point

     - Author: Mobilee - Łukasz Szarkowicz
     */
    enum Direction {
        case vertical
        case horizontal
        case custom(start: CGPoint, end: CGPoint)

        var startPoint: CGPoint {
            switch self {
            case .vertical:
                return CGPoint(x: 0.5, y: 0.0)

            case .horizontal:
                return CGPoint(x: 0.0, y: 0.5)

            case .custom(let start, _):
                return start
            }
        }

        var endPoint: CGPoint {
            switch self {
            case .vertical:
                return CGPoint(x: 0.5, y: 1.0)
            case .horizontal:
                return CGPoint(x: 1.0, y: 0.5)
            case .custom(_, let end):
                return end
            }
        }
    }

    /**
     Apply gradient to CALayer. Remember to use __layoutGradient()__ with every relayout of screen.

     - parameter colors: Array of colors used in gradient

     - parameter locations: Array of positions of colors used in gradient

     - parameter direction: enum value describing alignment of gradient

     - Author: Mobilee - Łukasz Szarkowicz
     */
    func applyGradient(withColors colors: [UIColor], andLocations locations: [NSNumber]? = nil, direction: Direction = .vertical ) {

        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = locations
        gradient.cornerRadius = cornerRadius
        gradient.startPoint = direction.startPoint
        gradient.endPoint = direction.endPoint
        if let sl = sublayers, sl.count > 0, sl[0] is CAGradientLayer {
            let lay = sl[0]
            replaceSublayer(lay, with: gradient)
        } else {
            self.insertSublayer(gradient, at: 0)
        }
    }

    /**
     Layout gradient to its bounds.

     - Author: Mobilee - Łukasz Szarkowicz
     */
    func layoutGradient() {
        if let sl = sublayers, sl.count > 0, sl[0] is CAGradientLayer {
            let gradient = sl[0]
            gradient.frame = self.bounds
        }
    }
}
