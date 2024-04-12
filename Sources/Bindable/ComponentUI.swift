//
//  ComponentUI.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 12/04/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import Foundation

public protocol ComponentUI: AnyObject {
    associatedtype ViewModel
    func update(with viewModel: ViewModel)
}
