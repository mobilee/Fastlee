//
//  AppDelegate.swift
//  Example
//
//  Created by Łukasz Szarkowicz on 31.08.2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

// MARK: - AppDelegate

/// The AppDelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// The UIWindow
    var window: UIWindow?
    var appCoordinator: MainCoordinator!
    
    /// The RootViewController
    var rootViewController: UIViewController {
        return ViewController()
    }

    /// Application did finish launching with options
    ///
    /// - Parameters:
    ///   - application: The UIApplication
    ///   - launchOptions: The LaunchOptions
    /// - Returns: The launch result
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize UIWindow
        self.window = .init(frame: UIScreen.main.bounds)
        
        appCoordinator = .init(window: window!)
        // Return positive launch
        return true
    }

}
