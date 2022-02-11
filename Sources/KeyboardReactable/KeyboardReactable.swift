//
//  KeyboardReactable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 11/02/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public protocol KeyboardReactable {
    var scrollView: UIScrollView { get }
}

public extension KeyboardReactable where Self: UIView {
    
    /**
     Default implementation with animation when keyboard show
     
     Example of usage:
     
     ```
     NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
        .receive(on: RunLoop.main)
        .sink { notification in
            self.handleKeyboardWillShow(notification)
        }
        .store(in: &bag)
     ```
     
     - parameter notification: Pass received keyboard notification.
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func handleKeyboardWillShow(_ notification: Notification) {
        
        let safeOffset = 32.0
        
        guard let info = notification.userInfo as? [String: AnyObject] else { return }
        guard let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.size, keyboardSize.height > 0 else { return }
        
        // Create content insets by substracting keyboard height
        var contentInsets = scrollView.contentInset
        contentInsets.bottom = keyboardSize.height
        
        var contentOffset = scrollView.contentOffset
        
        // calculate scroll position
        if let firstResponsder = findFirstResponder() as? UITextField {
            let screenHeight = frame.size.height
            let keyboardTopPoint = screenHeight - keyboardSize.height
            let offset = keyboardTopPoint / 4.0 + safeOffset
            let posY = scrollView.convert(firstResponsder.frame.origin, from: firstResponsder).y
            contentOffset.y = (posY - offset).clamped(to: 0...100000)
        }
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                self.scrollView.contentOffset = contentOffset
                self.scrollView.contentInset = contentInsets
                self.scrollView.scrollIndicatorInsets = contentInsets
                
                self.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    /**
     Default implementation with animation when keyboard hide
     
     Example of usage:
     
     ```
     NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
        .receive(on: RunLoop.main)
        .sink { notification in
            self.handleKeyboardWillHide(notification)
        }
        .store(in: &bag)
     ```
     
     - parameter notification: Pass received keyboard notification.
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func handleKeyboardWillHide(_ notification: Notification) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut, animations: {
                self.scrollView.contentInset = UIEdgeInsets.zero
                self.scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
                
                self.layoutIfNeeded()
            }, completion: nil)
        }
    }
}
