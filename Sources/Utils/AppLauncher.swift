//
//  AppLauncher.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 18/02/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public enum AppLauncher: String {
    case photos = "photos-redirect://"
    case voiceMemos = "voicememos://" // Won't work except within Notification Center"
    case appleNews = "applenews://"
    case videos = "videos://"
    case brightness = "launch://brightness/"
    case notes = "mobilenotes://"
    case reminders = "x-apple-reminder://"
    case appleWatch = "itms-watch://"
    case remote = "remote://"
    case phoneDial = "launch://dial"
    case calendar = "calshow://"
    case flashlight = "launch://light"
    case mail = "message://"
    case findMyIphone = "fmip1://"
    case podcasts = "pcast://"
    case books = "ibooks://"
    case garageBand = "garageband://"
    case trailers = "movietrailers://"
    case iTunesU = "itms-itunesu://"
    case iMovie = "fb309481925768757://"
    
    var parameters: String? { nil }
    
    public var url: URL? {
        let params = parameters ?? ""
        return URL(string: "\(self.rawValue)\(params)")
    }
    
    /**
     Check if it is possible to open URL.
     */
    public var canOpen: Bool {
        guard let url = url else {
            return false
        }
        
        return UIApplication.shared.canOpenURL(url)
    }
    
    public func open() {
        guard let url = url, canOpen == true else {
            logError(message: "Can't launch \(self) app.")
            return
        }
        
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
