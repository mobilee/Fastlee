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
        
        configureRateApp()
        
        RateApp.askIfNeeded()
        // Return positive launch
        return true
    }
    
    func configureRateApp() {
        
        RateApp.configure(with: self)
    }

}

extension AppDelegate: RateAppDelegate {

    var configuration: RateAppConfiguration {
        return RateAppConf()
    }
    
    func rateAppShouldPresentRatePopup(_ rateApp: RateApp) -> RateApp.Trigger {
        return RateApp.Trigger.custom { () -> Bool in
            return true
        }
    }
    
    func rateAppDidSelectResign(_ rateApp: RateApp) {
        return
    }
    
    func rateAppDidSelectLater(_ rateApp: RateApp) {
        return
    }
}

struct RateAppConf: RateAppConfiguration {
    var link: String = "http://"
    var alertTitle: String = "Nice app"
    var alertText: String = "Do you like this application?"
    var alertConfirmButtonName: String = "Yes"
    var alertDenyButtonName: String = "No"
    var alertSkipName: String = "Skip"
}
