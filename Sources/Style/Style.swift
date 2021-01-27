//
//  Style.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 11/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public struct Style<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol Styleable {
    associatedtype ObjectType
    
    /**
     Use this namespace to provide predefined configurations for your views.
     
     F.ex. you can create configurator for `roundedView` and use this function for every view you want to have with rounded corners.
     
     ````
     extension Style where Base: UILabel {
         @discardableResult
         func multiline() -> Style {
             self.base.numberOfLines = 0
             return self
         }
     }
     ````
     */
    var applyStyle: Style<ObjectType> { get }
}

public extension Styleable {
    var applyStyle: Style<Self> {
        return Style(self)
    }
}

extension UIView: Styleable {}
