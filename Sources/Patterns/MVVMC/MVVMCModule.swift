//
//  MVVMCModule.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 02/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

/**
 Protocol describing MVVM+C Module.
 
 If there is a few similar modules, each having different navigation or view model, use separate Module class for each one.
 */
protocol MVVMCModule {
    associatedtype ViewController: UIViewController
    associatedtype ViewModel
    associatedtype Navigation
    
    var navigation: Navigation { get }
    
    init(navigation: Navigation)
}

