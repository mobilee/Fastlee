//
//  UIResponder+ResignFirstResponder.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 18/01/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

extension UIResponder {
    /**
     Calls resign first responder on any control which is currently first responder.

     - returns: `true` if a first responder could handle the action, otherwise `false`

     - Author: Mobilee - Łukasz Szarkowicz
     */
    @discardableResult
    public static func resignFirstResponder() -> Bool {
        return UIApplication.shared.sendAction(NSSelectorFromString("resignFirstResponder"), to: nil, from: nil, for: nil)
    }
}
