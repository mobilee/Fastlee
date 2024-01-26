//
//  AttributedLinkBuilder.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 26/01/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import Foundation

// Builder lets create attributed string with embedded URLs.
public struct AttributedLinkBuilder {
    
    let attributedText: NSMutableAttributedString
    let urls: [String]
    let urlStyle: Attributes
    
    public init(text: String, style: Attributes, urls: [String], urlStyle: Attributes) {
        self.init(attributedText: text.mutableAttributedString(attr: style),
                  urls: urls,
                  urlStyle: urlStyle)
    }
    
    public init(attributedText: NSMutableAttributedString, urls: [String], urlStyle: Attributes) {
        self.attributedText = attributedText
        self.urls = urls
        self.urlStyle = urlStyle
    }
    
    /**
     Creates attributes string with following rules.
     
     1. Style each __substring__ which is placed between "\_\_" tokens, f.ex. \_\_clickable\_\_ with __urlStyle__ attributes.
     2. For each selected __substring__ set url given in array of __urls__ in order from start to end. If number of selected substrings and number of urls are different, then rules will be applied to the first elements for which both parameter exists.
     
     - returns: Attributed string to present.
     */
    public func build() -> NSAttributedString {
        do {
            let result: NSMutableAttributedString = attributedText
            let regex = try NSRegularExpression(pattern: "__(.*?)__", options: [])
            let matches = regex.matches(in: result.string, options: [],
                                        range: NSRange(location: 0,
                                                       length: result.string.utf16.count))
            
            let pairs = zip(matches, urls)
            
            // Use reverse order, so replacing characters on given ranges don't influence on other substrings.
            for (match, url) in pairs.reversed() {
                let range = match.range(at: 1)
                let substring = (result.string as NSString).substring(with: range)
                result.addAttributes(urlStyle, range: match.range)
                result.addAttributes([.link: url], range: match.range)
                result.replaceCharacters(in: NSRange(location: range.location - 2, length: range.length + 4), with: substring)
            }
            
            return result
        } catch {
            logError(message: "Could not build attributed string.")
            return attributedText
        }
    }
}
