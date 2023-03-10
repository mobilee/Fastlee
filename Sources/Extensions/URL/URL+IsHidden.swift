//
//  URL+IsHidden.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 09/03/2023.
//  Copyright © 2023 Mobilee. All rights reserved.
//

import Foundation

public extension URL {
    var isHidden: Bool {
        get {
            return (try? resourceValues(forKeys: [.isHiddenKey]))?.isHidden == true
        }
        
        set {
            var resourceValues = URLResourceValues()
            resourceValues.isHidden = newValue
            do {
                try setResourceValues(resourceValues)
            } catch {
                print("isHidden error:", error)
            }
        }
    }
}
