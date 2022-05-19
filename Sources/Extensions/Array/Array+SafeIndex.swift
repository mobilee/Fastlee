//
//  Array+SafeIndex.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 19/05/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import Foundation

public extension Array {
    
    /**
     Returns element from array with safe checking. If element not exist or index is out of bounds, function safely returns nil
     
     - parameter index: index used for safe checking element in the array
     - returns: Element of array at given index
     - Author: Mobilee - Łukasz Szarkowicz
     */
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    /**
     Returns list of elements for given index range using safe checking.
     
     - parameter indexRange: index range used for safe checking element in the array
     - returns: List of elements of array at given index range
     - Author: Mobilee - Łukasz Szarkowicz
     */
    subscript(safe indexRange: ClosedRange<Int>) -> [Element] {
        let localSafeRange = indices.startIndex...indices.endIndex-1
        let newRange = indexRange.clamped(to: localSafeRange)
        
        return Array(self[newRange])
    }
}
