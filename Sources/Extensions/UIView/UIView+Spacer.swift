//
//  UIView+Spacer.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 28/04/2023.
//  Copyright © 2023 Mobilee. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     Build UIView to use as a spacer which fills available gaps.
     
     Constraints are set to fill all available space horizontally and vertically
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    class func spacer() -> UIView {
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .vertical)
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        return spacer
    }
    
    /**
     Build UIView to use as a spacer and set its width.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    class func spacer(width: CGFloat) -> UIView {
        let spacer = UIView()
        spacer.anchor(width: width)
        
        return spacer
    }
    
    /**
     Build UIView to use as a spacer and set its height.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    class func spacer(height: CGFloat) -> UIView {
        let spacer = UIView()
        spacer.anchor(height: height)
        
        return spacer
    }
}
