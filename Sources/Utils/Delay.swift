//
//  Delay.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 01/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import Foundation

public class Delay {

    /**
     Execute block of code with delay.

     - parameter delay: value in seconds after which completion block will be executed

     - parameter completion: code block to execute after provided delay time

     - Author: Mobilee - Łukasz Szarkowicz
     */
    public class func after(_ delay: Double, completion:@escaping () -> Void) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
            execute: completion)
    }
}
