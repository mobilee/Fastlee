//
//  UILabel+SetLineSpacing.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 24/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public extension UILabel {
    /**
     Set line spacing using `NSMutableParagraphStyle`.
     
     Use this method after setting text of `UILabel`
     
     - parameter lineSpacing: value of line spacing
     */
    func setLineSpacing(_ lineSpacing: CGFloat) {
        guard let text = self.text else {
            return
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        let attr: Attributes = [.paragraphStyle: paragraphStyle]
        let attrText = text.mutableAttributedString(attr: attr)
        self.attributedText = attrText
    }
}
