//
//  BindingConfigurable.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 12/04/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import Foundation
import Combine

@available(iOS 14.0, *)
public protocol BindableUIComponent {
    associatedtype ViewModel
    var bindingsBag: Set<AnyCancellable> { get set }
    func bind(to viewModel: ViewModel)
}
