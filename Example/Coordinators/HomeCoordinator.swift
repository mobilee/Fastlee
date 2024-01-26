//
//  HomeCoordinator.swift
//  Example
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

class HomeCoordinator: NavigationCoordinator {
    
    override func start() {
        let view = HomeModule.build(for: self)
        setViewControllers([view], animated: false)
    }
}

extension HomeCoordinator: HomeRouter {
    func openNibLoadExample(from viewController: UIViewController) {
        let view = LoadNibExampleModule.build(for: self)
        push(view, animated: true)
    }
    
    func openReusableCellsExample(from viewController: UIViewController) {
        let view = ReusableCellsExampleViewController.instantiate()
        push(view, animated: true)
    }
    
    func openDrawShadows(from viewController: UIViewController) {
        let view = DrawShadowsModule.build(for: self)
        push(view, animated: true)
    }
    
    func openDatePicker(from viewController: UIViewController) {
        if #available(iOS 14.0, *) {
            let picker = DatePicker()
            picker.configure(mode: .date, date: Date(), minimumDate: nil, maximumDate: Date())
            
//            let view = picker.toAlertController(title: "Title example", message: "Message here ...", sourceView: nil, buttonTitle: "OK", handler: nil)
            let view = picker.toAlertController(title: nil, message: nil, sourceView: nil, buttonTitle: "OK", handler: nil)
            
//            (navigationController as! UIViewController).present(view, animated: true, completion: nil)
            present(view, animated: true, completion: nil)
        }
    }
    
    func openMakeConstraintsExample(from viewController: UIViewController) {
        let scene = MakeConstraintsExample()
        push(scene, animated: true)
    }
    
    func openStackViewExample(from viewController: UIViewController) {
        let scene = StackViewExampleViewController()
        push(scene, animated: true)
    }
    
    func openCombineExample(from viewController: UIViewController) {
        if #available(iOS 13, *) {
            let scene = CombineExampleModule(navigation: self).build()
            push(scene, animated: true)
        }
    }
}

extension HomeCoordinator: LoadNibExampleRouter {}

extension HomeCoordinator: DrawShadowsRouter {}

extension HomeCoordinator: CombineExampleNavigation {
    
}
