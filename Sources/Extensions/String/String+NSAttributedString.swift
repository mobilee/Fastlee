//
//  String+NSAttributedString.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 05/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import Foundation

public extension String {
    
    /**
     Create NSAttributedString based on given String and Dictionary of parameters
     
     - parameter attr: Dictionary of parameters for NSAttributedString
     
     - returns: NSAttributedString
     */
    func attributedString(attr: [NSAttributedString.Key: Any]) -> NSAttributedString {
        NSAttributedString(string: self, attributes: attr)
    }
    
    /**
     Create NSMutableAttributedString based on given String and Dictionary of parameters
     
     - parameter attr: Dictionary of parameters for NSMutableAttributedString
     
     - returns: NSMutableAttributedString
     */
    func mutableAttributedString(attr: [NSAttributedString.Key: Any]) -> NSMutableAttributedString {
        NSMutableAttributedString(string: self, attributes: attr)
    }
}
