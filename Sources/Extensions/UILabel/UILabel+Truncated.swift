//
//  UILabel+Truncated.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public extension UILabel {

    /**
     Check if Label is truncated or it fits in frame.

     If __yes__, means that all text is visible. If __no__, means that label is truncated.

     - Author: Mobilee - Łukasz Szarkowicz
     */
    var isTruncated: Bool {
        guard let labelText = text else {
            return false
        }

        let maxSize = CGSize(width: frame.size.width, height: .greatestFiniteMagnitude)

        let labelTextSize = (labelText as NSString).boundingRect(
            with: maxSize,
            options: .usesLineFragmentOrigin,
            attributes: [.font: self.font as Any],
            context: nil).size

        return labelTextSize.height > bounds.size.height
    }
}
