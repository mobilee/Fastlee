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
    
    @discardableResult
    func insertArrangedSubview(_ view: UIView, after arrangedSubview: UIView) -> Bool {
        guard let index = arrangedSubviews.firstIndex(of: arrangedSubview) else {
            logError(message: "Could not find view in Stack View's arranged subviews.")
            return false
        }
        insertArrangedSubview(view, at: index)
        return true
    }
    
    /**
     Convenient method to add spacer after given arranged subview.
     
     If arrangedSubview not provided, it adds spacer as the last view.
     */
    func addSpacer(after arrangedSubview: UIView? = nil) {
        if let arr = arrangedSubview {
            insertArrangedSubview(UIView.spacer(), after: arr)
        } else {
            addArrangedSubview(UIView.spacer())
        }
    }
}
