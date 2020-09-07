//
//  Fonts.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 01/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public struct Fonts {

    /**
     List all available fonts in application.

     List is printed in console using _debugPrint()_ function.

     - Author: Mobilee - Łukasz Szarkowicz
     */
    public static func printList() {
        let divider: String = "----------------------"
        UIFont.familyNames.forEach { familyName in
            debugPrint(divider)
            debugPrint("🔤 Font family: " + familyName)
            UIFont.fontNames(forFamilyName: familyName).forEach({ (name) in
                debugPrint("   - \(name)")
            })
        }
    }
}
