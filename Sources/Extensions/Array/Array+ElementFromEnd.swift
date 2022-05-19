//
//  Array+ElementFromEnd.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 19/05/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import Foundation

public extension Array {
    /**
     Return element by counting index from end.
     
     There is given array `["A", "B", "C", "D", "E", "F"]`
     
     `element(fromEnd: 3)` returns "C"
     
     - parameter distance: distance from array's end.
     - returns: Index of searching vc
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func element(fromEnd distance: Int) -> Element? {
        return self[safe: count-1-distance]
    }
}
