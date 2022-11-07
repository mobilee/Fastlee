//
//  String+Int.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 07/11/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import Foundation

public extension String {
    
    /**
     Creates Int from String using NumberFormatter.
     */
    var int: Int? {
        return NumberFormatter().number(from: self)?.intValue
    }
}
