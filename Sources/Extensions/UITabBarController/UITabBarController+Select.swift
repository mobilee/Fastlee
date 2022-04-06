//
//  UITabBarController+Select.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 06/04/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public extension UITabBarController {
    /**
     Find index of viewController tab in UITabBarController
     - parameter viewController: View Controller for which is searched index
     - returns: Index of searching vc
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func tabIndex(for viewController: UIViewController) -> Int? {
        viewControllers?.firstIndex(of: viewController)
    }
    
    /**
     Selecting tab in UITabBarController by index
     - parameter index: Index of view controller
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func selectTab(at index: Int) {
        guard let all = viewControllers, all.count > index else {
            logError(message: "Could not select tab at \(index)")
            return
        }
        
        selectedIndex = index
    }
    
    /**
     Selecting tab in UITabBarController by pointing the view controller
     - parameter viewController: View Controller object which should be selected
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func selectViewController(_ viewController: UIViewController) {
        if let index = tabIndex(for: viewController) {
            selectTab(at: index)
        } else {
            logError(message: "UITabBarController does not contain this UIViewController")
        }
    }
}
