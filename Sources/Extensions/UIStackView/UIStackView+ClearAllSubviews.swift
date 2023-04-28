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
    
    /**
     Add multiple arranged subviews at once.
     */
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
    
    /**
     Add multiple arranged subviews at once using array of UIViews.
     */
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
    
    /**
     Convenient method to add spacer after given arranged subview.
     
     If arrangedSubview not provided, it adds spacer as the last view.
     */
    func addSpacer(after arrangedSubview: UIView? = nil) {
        if let arr = arrangedSubview {
            guard let index = arrangedSubviews.firstIndex(of: arr) else {
                logError(message: "Can't add spacer after \(arr) cause it doesn't exist in Stack View")
                return
            }
            insertArrangedSubview(UIView.spacer(), at: index)
        } else {
            addArrangedSubview(UIView.spacer())
        }
    }
}
