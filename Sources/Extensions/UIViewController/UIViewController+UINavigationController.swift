//
//  UIViewController+UINavigationController.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 21/06/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    /**
     Create UINavigationController and embed given UIViewController in it.
     
     - returns: UINavigationController with embed UIViewController
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func embedInNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
