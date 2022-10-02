//
//  Array+NextAfter.swift
//  Example
//
//  Created by Łukasz Szarkowicz on 13/09/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    
    /**
     Return the next element after given.
     
     Elements has to conform Equatable protocol
     
         There is given array `["A", "B", "C", "D", "E", "F"]`
         
         `nextAfter("C")` returns "D"
     
     If element doesn't exist in the array, function returns `nil`
     
     - parameter element: element to look for in the array
     - returns: the next element after input element
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func nextAfter(_ element: Element) -> Element? {
        guard let index = firstIndex(of: element) else { return nil }
        let nextIndex = index.advanced(by: 1)
        
        return self[safe: nextIndex]
    }
}
