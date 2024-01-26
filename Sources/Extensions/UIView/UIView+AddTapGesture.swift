//
//  UIView+AddTapGesture.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 26/01/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     Create UITapGestureRecognizer and add it into receiver. It automaticaly enables user interactions on the view.
     
     - returns: Gesture recognizer added to receiver
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func addTapGesture() -> UITapGestureRecognizer {
        let gesture = UITapGestureRecognizer()
        self.addGestureRecognizer(gesture)
        self.isUserInteractionEnabled = true
        
        return gesture
    }
}
