//
//  HomeRouter.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit


protocol HomeRouter: AnyObject {
    func openNibLoadExample(from viewController: UIViewController)
    func openReusableCellsExample(from viewController: UIViewController)
    func openDrawShadows(from viewController: UIViewController)
    func openDatePicker(from viewController: UIViewController)
    func openMakeConstraintsExample(from viewController: UIViewController)
    func openStackViewExample(from viewController: UIViewController)
    func openCombineExample(from viewController: UIViewController)
}

