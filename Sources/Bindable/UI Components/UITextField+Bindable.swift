//
//  UITextField+Bindable.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 12/04/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import UIKit
import Combine

@available(iOS 13.0, *)
extension UITextField: AtomicUIComponent {
    
    public func update(with viewModel: String?) {
        self.text = viewModel
    }
    
    public var bindablePublisher: AnyPublisher<String?, Never> {
        return textPublisher
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
}

@available(iOS 13.0, *)
public extension UITextField {
    
    var textPublisher: AnyPublisher<String?, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .map { ($0.object as? UITextField)?.text }
            .eraseToAnyPublisher()
    }
}
