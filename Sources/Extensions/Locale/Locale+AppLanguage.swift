//
//  Locale+AppLanguage.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 15/04/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import Foundation

@available(iOS 16.0, *)
public extension Locale {

    /**
     Language used as preffered language by user in system.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    static var appLanguage: String {
        let identifier = Locale.autoupdatingCurrent.identifier
        guard let prefferedLanguage = Locale.preferredLanguages.first else {
            return identifier
        }
        
        let locale = Locale(identifier: prefferedLanguage)
        return locale.language.languageCode?.identifier ?? identifier
    }
}
