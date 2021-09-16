//
//  HomeRouter.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit


protocol HomeRouter: class {
    func openNibLoadExample(from viewController: UIViewController)
    func openReusableCellsExample(from viewController: UIViewController)
    func openDrawShadows(from viewController: UIViewController)
}

