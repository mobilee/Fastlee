//
//  ViewTypeInitialization.swift
//  Example
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

internal enum ViewTypeInitialization: Equatable {
    case `class`
    case nib(nibObject: UINib)
    case storyboard
}
