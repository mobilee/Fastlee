//
//  Comparable+Clamped.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import Foundation

public extension Comparable {
    /**
     Limit any comparable value to some boundaries.

     - parameter limits: Range value describing upper and lower bounds to which value should be clamped.

     - returns: object of the same type clamped inside limits.

     - Author: Mobilee - Łukasz Szarkowicz
     */
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
