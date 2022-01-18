//
//  Applyer.swift
//  Example
//
//  Created by Lukasz Szarkowicz on 07/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public struct Applyer<Element> {

    private let configureHandler: (Element) -> Void

    public init(_ configuration: @escaping (Element) -> Void) {
        self.configureHandler = configuration
    }
    
    @discardableResult
    public func apply(to element: Element) -> Element {
        configureHandler(element)
        return element
    }
}

public protocol Appliable: AnyObject {
    associatedtype Element
    func apply(using configuration: Applyer<Element>) -> Element
    func apply(_ configurator: (Element) throws -> Void) rethrows -> Element
}

extension Appliable {

    /**
     Applies a code closure to this object.

     Example of usage:

     ```
     let button = UIButton()
     button.apply(using: .filled).apply(using: .rounded)
     ```

     - parameter configuration: The configuration to apply.
     - Author: Mobilee - Łukasz Szarkowicz
     */
    @discardableResult
    public func apply(using configuration: Applyer<Self>) -> Self {
        return configuration.apply(to: self)
    }
    
    @discardableResult
    public func apply(_ configurator: (Self) throws -> Void) rethrows -> Self {
        // Run the provided configurator:
        try configurator(self)
        return self
    }
}

//extension Appliable where Self: UIView {
//    public init(configuration: Applyer<Self>) {
//        self.init()
//        apply(configuration)
//    }
//}

extension NSObject: Appliable {}
