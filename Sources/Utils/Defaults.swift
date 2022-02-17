//
//  Defaults.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 01/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import Foundation

public protocol UserDefaultsCompatible {}

// MARK: - UserDefaults Compatibile Types
extension Bool: UserDefaultsCompatible {}
extension Int: UserDefaultsCompatible {}
extension Double: UserDefaultsCompatible {}
extension Float: UserDefaultsCompatible {}
extension String: UserDefaultsCompatible {}
extension Data: UserDefaultsCompatible {}
extension Date: UserDefaultsCompatible {}
extension Array: UserDefaultsCompatible where Element: UserDefaultsCompatible {}
extension Dictionary: UserDefaultsCompatible where Key == String, Value: UserDefaultsCompatible {}

@propertyWrapper
public struct UserDefault<T: UserDefaultsCompatible>: UserDefaultOperating {
    public let key: String
    private let defaultValue: T
    public let suiteName: String?

    public init(key: String, defaultValue: T, suiteName: String? = nil) {
        self.key = key
        self.defaultValue = defaultValue
        self.suiteName = suiteName
    }
    
    public var wrappedValue: T {
        get {
            // Read value from UserDefaults
            return self.database?.object(forKey: key) as? T ?? defaultValue
        }
        set {
            // Set value to UserDefaults
            self.database?.set(newValue, forKey: key)
        }
    }
}

@propertyWrapper
public struct OptionalUserDefault<T: UserDefaultsCompatible>: UserDefaultOperating {
    public let key: String
    public let suiteName: String?

    public init(key: String, suiteName: String? = nil) {
        self.key = key
        self.suiteName = suiteName
    }
    
    public var wrappedValue: T? {
        get {
            // Read value from UserDefaults
            return self.database?.object(forKey: key) as? T
        }
        set {
            // Set value to UserDefaults
            self.database?.set(newValue, forKey: key)
        }
    }
}

public protocol UserDefaultOperating {
    associatedtype T
    var key: String { get }
    var suiteName: String? { get }
    
    /// Removes value from the storage.
    ///
    /// Removes value directly form the storage managin this value (based on _suiteName_)
    func removeStorageValue()
}

extension UserDefaultOperating {
    public func removeStorageValue() {
        UserDefaults(suiteName: suiteName)?.removeObject(forKey: key)
    }
    
    fileprivate var database: UserDefaults? {
        let database = UserDefaults(suiteName: suiteName)
        if database == nil {
            logError(message: "Could not find UserDefaults for suiteName: \(String(describing: suiteName)) while operating with UserDefault: \(key)")
        }
        
        return database
    }
}

//public class Defaults {
//
//    public static let shared = Defaults()
//
//    public var suiteName: String? = Bundle.main.bundleIdentifier
//    var userDefaults: UserDefaults {
//        return UserDefaults(suiteName: suiteName) ?? UserDefaults.standard
//    }
//
//    public class Value<T: Any>: CustomDebugStringConvertible, CustomStringConvertible {
//        private var key: String
//        public var value: T? {
//            get { return Defaults.shared.userDefaults.object(forKey: key) as? T }
//            set { Defaults.shared.userDefaults.set(newValue, forKey: key) }
//        }
//
//        public init(forKey key: String, defaultValue: T? = nil) {
//            self.key = key
//            if defaultValue != nil, self.value == nil {
//                self.value = defaultValue
//            }
//        }
//
//        public var debugDescription: String {
//            let msg: String = "User defaults (suite named: \(String(describing: Defaults.shared.userDefaults))"
//                + "\n   key: \(self.key)"
//                + "\n   value: \(String(describing: self.value))"
//
//            return msg
//        }
//
//        public var description: String {
//            return debugDescription
//        }
//    }
//}
