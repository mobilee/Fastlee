//
//  UILabel+SetLineHeight.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 24/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public extension UILabel {
    /**
     Set line height using `NSMutableParagraphStyle`.
     
     Use this method after setting text of `UILabel`
     
     - parameter lineHeight: value of line height
     */
    func setLineHeight(_ lineHeight: CGFloat) {
        guard let text = self.text else {
            return
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeight
        let attr: Attributes = [.paragraphStyle: paragraphStyle]
        let attrText = text.mutableAttributedString(attr: attr)
        self.attributedText = attrText
    }
}
