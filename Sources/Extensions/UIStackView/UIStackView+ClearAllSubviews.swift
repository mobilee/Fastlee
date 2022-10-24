//
//  UIStackView+ClearAllSubviews.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 24/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public extension UIStackView {
    
    /**
     Remove all arranged subviews from UIStackView.
     */
    func clearAllSubviews() {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}
