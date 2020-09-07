//
//  AssociatedObject.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import Foundation

public protocol AssociatedObjectAccessible {}

public extension AssociatedObjectAccessible {

    func getAssociatedObject<T>(for key: UnsafeRawPointer) -> T? {
        return objc_getAssociatedObject(self, key) as? T
    }

    func getAssociatedObject<T>(for key: UnsafeRawPointer,
                                defaultValue: T,
                                defaultValuePolicy: AssociatedObjectAccessiblePolicy? = nil) -> T {

        guard let object = objc_getAssociatedObject(self, key) as? T else {
            if let policy = defaultValuePolicy {
                setAssociatedObject(for: key, value: defaultValue, policy: policy)
            } else {
                setAssociatedObject(for: key, value: defaultValue)
            }

            return defaultValue
        }

        return object
    }

    func setAssociatedObject<T>(for key: UnsafeRawPointer,
                                value: T?,
                                policy: AssociatedObjectAccessiblePolicy = .strong) {
        objc_setAssociatedObject(self, key, value, policy.rawValue)
    }
}

public enum AssociatedObjectAccessiblePolicy {
    /// Specifies a weak reference to the associated object.
    case weak

    /// Specifies a strong reference to the associated object.
    ///
    /// The association is not made atomically.
    case strong

    /// Specifies a strong reference to the associated object.
    ///
    /// The association is made atomically.
    case strongAtomic

    /// Specifies that the associated object is copied.
    ///
    /// The association is not made atomically.
    case copy

    /// Specifies that the associated object is copied.
    ///
    /// The association is made atomically.
    case copyAtomic

    fileprivate var rawValue: objc_AssociationPolicy {
        switch self {
        case .weak:
            return .OBJC_ASSOCIATION_ASSIGN
        case .strong:
            return .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        case .strongAtomic:
            return .OBJC_ASSOCIATION_RETAIN
        case .copy:
            return .OBJC_ASSOCIATION_COPY_NONATOMIC
        case .copyAtomic:
            return .OBJC_ASSOCIATION_COPY
        }
    }
}

extension NSObject: AssociatedObjectAccessible {}
