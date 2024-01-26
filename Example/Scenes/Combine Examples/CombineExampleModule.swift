//
//  CombineExampleModule.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 23/01/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

@available(iOS 13.0, *)
class CombineExampleModule {
    // MARK: - Navigation
    var navigation: Navigation
    
    required init(navigation: Navigation) {
        self.navigation = navigation
    }
    
    // MARK: - Builders
    func build() -> ViewController {
        let viewController = ViewController()
        viewController.title = "CombineExample"
        viewController.viewModel = ViewModel(navigation: navigation)
        
        return viewController
    }
}

@available(iOS 13.0, *)
extension CombineExampleModule: MVVMCModule {
    // MARK: - Types
    typealias ViewController = CombineExampleViewController
    typealias ViewModel = CombineExampleViewModel
    typealias Navigation = CombineExampleNavigation
}
