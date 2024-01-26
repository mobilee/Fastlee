//
//  UIView+Embedded.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 16/12/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     Embed view in container (another view) and set insets.
     
     - parameter view: container in which receiver will be embedded. If not given, new view will be created.
     - parameter insets: Insets used to layout receiver in new container.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    @discardableResult
    func embedded(in view: UIView = UIView(), with insets: UIEdgeInsets) -> UIView {
        view.addSubview(self)
        self.anchor(to: view, insets: insets)
        
        return view
    }
    
    /**
     Embed view in a new container (another view) without any layout.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func embedded() -> UIView {
        let holder = UIView()
        holder.addSubview(self)
        
        return holder
    }
}
