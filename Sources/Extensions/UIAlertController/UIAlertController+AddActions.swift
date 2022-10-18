//
//  UIAlertController+AddActions.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 18/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    /**
     Add actions to UIAlertController
     
     - parameter actions: list of actions `UIAlertAction`
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func addActions(_ actions: [UIAlertAction]) {
        actions.forEach { action in
            self.addAction(action)
        }
    }
}
