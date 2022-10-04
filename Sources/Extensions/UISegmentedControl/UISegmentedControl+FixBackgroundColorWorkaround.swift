//
//  UISegmentedControl+FixBackgroundColorWorkaround.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 04/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public extension UISegmentedControl {
    
    // https://stackoverflow.com/a/73948039/3840884
    func fixBackgroundColorWorkaround() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            for i in 0 ... (self.numberOfSegments-1) {
                let bg = self.subviews[i]
                bg.isHidden = true
            }
        }
    }
}
