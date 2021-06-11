//
//  UIBarButtonItem+Init.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 11/06/2021.
//  Copyright © 2021 Mobilee. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    
    enum Order {
        case imageLeft
        case imageRight
    }
    
    /**
     Create UIBarButtonItem with image and title together.
     
     - parameter image: Image used for button
     - parameter title: Title used for button
     - parameter target: Target for button
     - parameter action: action handler for button click
     
     - returns: UIBarButtonItem element
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    static func create(with image: UIImage, title: String, spacing: CGFloat = 4.0, order: Order, target: Any?, action: Selector) -> UIBarButtonItem {

        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        button.sizeToFit()
        button.addTarget(target, action: action, for: .touchUpInside)

        let spacing = spacing / 2
        if order == .imageRight {
            // label width with spacing
            let labelW = button.titleLabel?.frame.size.width ?? 0
            let imgInset =  labelW + spacing
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: imgInset, bottom: 0, right: -imgInset)
            // image width with spacing
            let imgW = button.currentImage?.size.width ?? 0
            let labelInset =  imgW + spacing
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -labelInset, bottom: 0, right: labelInset)
            
            button.contentEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        } else {
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: -spacing)
            button.contentEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        }
        
        return UIBarButtonItem(customView: button)
    }
}
