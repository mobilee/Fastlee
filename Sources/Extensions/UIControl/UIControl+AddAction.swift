//
//  UIControl+AddAction.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 05/04/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import UIKit

@available(iOS 14.0, *)
extension UIControl {
    @MainActor
    func addAction(for controlEvents: UIControl.Event = .touchUpInside,
                   actionHandler: @escaping (UIAction) -> Void) {
        
        let action = UIAction { elem in
            actionHandler(elem)
        }
        addAction(action, for: controlEvents)
    }
}
