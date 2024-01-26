//
//  UITapGestureRecognizer+TouchPublisher.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 26/01/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import Combine
import UIKit

@available(iOS 13.0, *)
public extension UITapGestureRecognizer {
    
    /**
     Creates Publisher which sends signal when touch has been recognized.
     
     - returns: Publisher with CGPoint location of touch.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func touchLocationPublisher() -> AnyPublisher<CGPoint, Never> {
        let recognizer = self
        
        return recognizer.publisher(for: \.state)
            .compactMap { $0 == .ended ? recognizer : nil }
            .map { $0.location(in: $0.view) }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
