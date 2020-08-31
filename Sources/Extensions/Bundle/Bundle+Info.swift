//
//  Bundle+Info.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import Foundation

public extension Bundle {
    /**
     Returns name of application.

     - Author: Mobilee - Łukasz Szarkowicz
     */
    static var appName: String? {
        return main.object(forInfoDictionaryKey: "CFBundleName") as? String
    }

    /**
     Returns version of application. __e.g. 1.0.3__

     - Author: Mobilee - Łukasz Szarkowicz
     */
    static var appVersion: String? {
        return main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    /**
     Returns build number of application. __e.g. 253__

     - Author: Mobilee - Łukasz Szarkowicz
     */
    static var appBuild: String? {
        return main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }

    /**
     Returns identifier of application. __e.g. 253__

     - Author: Mobilee - Łukasz Szarkowicz
     */
    static var identifier: String? {
        return main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String
    }
}

