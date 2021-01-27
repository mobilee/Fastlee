//
//  RateApp.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 26/01/2021.
//  Copyright © 2021 Mobilee. All rights reserved.
//

import UIKit
import StoreKit

@available(iOS 10.3, *)
public class RateApp {
    private static let shared = RateApp()
    
    private weak var delegate: RateAppDelegate?
    
    private var rootVC: UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController
    }
    
    @OptionalUserDefault(key: "RateApp.defaults.lastAlertOpenTimestamp")
    private var lastAlertOpenTimestamp: TimeInterval?
    
    @UserDefault(key: "RateApp.defaults.appOpensWithoutAlert", defaultValue: 1)
    private var appOpensWithoutAlert: Int
    
    init() {
        if lastAlertOpenTimestamp == nil { lastAlertOpenTimestamp = Date.timeIntervalSinceReferenceDate }
        appOpensWithoutAlert += 1
    }
    
    public static func configure(with delegate: RateAppDelegate) {
        shared.delegate = delegate
    }
    
    public static func askForReview() {
        guard let conf = shared.delegate?.configuration,
              let url = URL(string: conf.link) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    public static func askIfNeeded() {
        shared.ask()
    }
    
    private func ask() {
        guard let delegate = delegate else {
            logError(message: "RateApp: Could not find settings for module. Provide it using 'public static func configure(with delegate: RateAppDelegate)'")
            return
        }
        
        guard shouldPresentReview() == true else { return }
        
        askForReview()
    }
    
    func shouldPresentReview() -> Bool {
        guard let trigger = delegate?.rateAppShouldPresentRatePopup(self) else { return false }
        
        switch trigger {

        case .afterDays(let days):
            let diff: TimeInterval = Double(days) * 24.0 * 60.0 * 60.0
            let lastOpen = Date(timeIntervalSinceReferenceDate: lastAlertOpenTimestamp!)
            let secureDate = Date(timeInterval: diff, since: lastOpen)
            
            // If number of days already passed
            return secureDate < Date()
        case .afterOpens(let appOpens):
            return appOpensWithoutAlert > appOpens
        case .custom(verifier: let verifier):
            return verifier()
        }
    }
    
    public func askForReview() {
        let alert = self.buildAlert()
       
        Delay.after(0.5) { [weak self] in
            guard let `self` = self else { return }
            self.rootVC?.present(alert, animated: true)
        }
    }
    
    private func buildAlert() -> UIAlertController {
        let alert = UIAlertController(title: delegate?.configuration.alertTitle, message: delegate?.configuration.alertText, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: delegate?.configuration.alertConfirmButtonName, style: .default) { [weak self] (_) in
            self?.openReviewPicker()
        }
        
        let noAction = UIAlertAction(title: delegate?.configuration.alertDenyButtonName, style: .destructive) { [weak self] (_) in
            guard let `self` = self else { return }
            self.delegate?.rateAppDidSelectResign(self)
        }
        
        let laterAction = UIAlertAction(title: delegate?.configuration.alertSkipName, style: .cancel) { [weak self] (_) in
            guard let `self` = self else { return }
            self.delegate?.rateAppDidSelectLater(self)
        }
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        alert.addAction(laterAction)
        
        return alert
    }
    
    private func openReviewPicker() {
        SKStoreReviewController.requestReview()
    }
}

@available(iOS 10.3, *)
public protocol RateAppDelegate: UIApplicationDelegate {
    var configuration: RateAppConfiguration { get }
    func rateAppShouldPresentRatePopup(_ rateApp: RateApp) -> RateApp.Trigger
    func rateAppDidSelectResign(_ rateApp: RateApp)
    func rateAppDidSelectLater(_ rateApp: RateApp)
}

@available(iOS 10.3, *)
public extension RateApp {
    enum Trigger {
        case afterDays(days: Int)
        case afterOpens(appOpens: Int)
        case custom(verifier: () -> Bool)
    }
}

@available(iOS 10.3, *)
public protocol RateAppConfiguration {
    var link: String { get }
    var alertTitle: String { get }
    var alertText: String { get }
    var alertConfirmButtonName: String { get }
    var alertDenyButtonName: String { get }
    var alertSkipName: String { get }
}
