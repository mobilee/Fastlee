//
//  UIView+Add.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public extension UIView {

    /**
     Add multiple subviews to self. Provide subviews as elements not array.

     - parameter subviews: elemets to add to self

            let myView = UIView()
            let button = UIButton()
            let button2 = UIButton()

            myView.add(button, button2)
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func add(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}
