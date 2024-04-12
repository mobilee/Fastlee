//
//  UILabel+Observer.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 12/04/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import UIKit

extension UILabel: Observer {
    public func update(with viewModel: String?) {
        text = viewModel
    }
}
