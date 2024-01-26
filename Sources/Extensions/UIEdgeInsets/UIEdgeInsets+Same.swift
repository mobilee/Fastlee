//
//  UIEdgeInsets+Same.swift
//  Example
//
//  Created by Łukasz Szarkowicz on 24/01/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import UIKit

public extension NSDirectionalEdgeInsets {
    
    static func same(_ inset: CGFloat) -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
    }
}

public extension UIEdgeInsets {
    static func same(_ inset: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
