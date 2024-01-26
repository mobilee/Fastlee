//
//  UILabel+Link.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 26/01/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import Combine
import UIKit

public extension UILabel {
    /**
     Creates Publisher which sends signal when url embed in attributed string has been touched.
     
     - Returns: Publisher which sends signal with touched URL.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    @available(iOS 13.0, *)
    func tapLinkPublisher() -> AnyPublisher<URL, Never> {
        let label = self
        
        return addTapGesture()
            .touchLocationPublisher()
            .compactMap { location in
                return label.attributedLink(at: location)
            }.eraseToAnyPublisher()
    }
    
    /**
     Find character index in content string for given location.
     
     - Returns: Character index
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func characterIndex(for location: CGPoint) -> Int {
        // Create instances of NSLayoutManager, NSTextContainer, and NSTextStorage
        let textStorage = NSTextStorage(attributedString: self.attributedText!)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        
        let textContainer = NSTextContainer(size: self.bounds.size)
        textContainer.lineFragmentPadding = 0
        textContainer.maximumNumberOfLines = self.numberOfLines
        textContainer.lineBreakMode = self.lineBreakMode
        
        layoutManager.addTextContainer(textContainer)
        
        // Find the tapped character index
        return layoutManager.characterIndex(for: location,
                                            in: textContainer,
                                            fractionOfDistanceBetweenInsertionPoints: nil)
    }
    
    func attributedLink(at index: Int) -> URL? {
        var link = attributedText?.attribute(.link, at: index, effectiveRange: nil) as? String
        return link?.url
    }
    
    func attributedLink(at location: CGPoint) -> URL? {
        let index = characterIndex(for: location)
        return attributedLink(at: index)
    }
}
