//
//  UIView+FindFirstResponder.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 11/02/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public extension UIView {
    /**
     Find subview which is first responder
     
     - returns: UIView which is actually first responder.
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func findFirstResponder() -> UIView? {
        var searchingView: UIView?
        
        for view in subviews {
            if view.isFirstResponder {
                return view
            } else if view.subviews.isEmpty == false {
                searchingView = view.findFirstResponder()
            }
            
            if searchingView != nil {
                return searchingView
            }
        }
        return nil
    }
}
