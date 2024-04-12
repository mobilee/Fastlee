//
//  SceneBindable.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 12/04/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import UIKit
import Combine

// MARK: - SceneBindable Protocol
@available(iOS 14.0, *)
public protocol SceneBindable: UIViewController, BindingConfigurable {
    var viewModel: ViewModel! { get set }
}

// MARK: - Scene
@available(iOS 14.0, *)
open class Scene<T>: UIViewController, SceneBindable {
    public var bindingsBag = Set<AnyCancellable>()
    
    public var viewModel: T! {
        didSet {
            update(with: viewModel)
            setupBindings(with: viewModel)
        }
    }
    
    public func setupBindings(with viewModel: T) {
        bindingsBag.removeAll()
    }
    
    public func update(with viewModel: T) {
    }
}
