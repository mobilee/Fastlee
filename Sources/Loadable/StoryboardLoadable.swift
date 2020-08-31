//
//  StoryboardLoadable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

/**
 Instantiate UIViewControllers designed in Storyboard.

 Provide `storyboardIdentifier` in case of the View Controller is not root view controller in Storyboard and you want to instantiate View Controller using `storyboard identifier`.

 - requires: Storyboard Identifier has to be set in Storyboard in case of using instantiate with identifier.
 */
public protocol StoryboardLoadable {
    static var storyboardName: String { get }
    static var storyboardIdentifier: String? { get }
}

public extension StoryboardLoadable where Self: UIViewController {

    /**
     It is name of storyboard where is designed View Controller.

     Default implementation of `storyboardName` returns name based on view controller's name, by trimming it's name from `ViewController` part.

     F. ex. `MyScreenViewController` will return `MyScreen` as `storyboardName`

     - Note: You can implement your own implementation of `storyboardName` in your project based on pattern used in project. It can be done with overriding `var storyboardName` implementation. Look on example below.

     ```
     extension StoryboardLoadable where Self: UIViewController {
         static var storyboardName: String {
            return String(describing: self).replacingOccurrences(of: "ViewController", with: "VC")
         }
     }
     ```
     */
    static var storyboardName: String {
        return String(describing: self).replacingOccurrences(of: "ViewController", with: "")
    }

    static var storyboardIdentifier: String? {
        return nil
    }

    static func instantiate() -> Self {

        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)

        if let identifier = storyboardIdentifier {
            return instantiateVC(withIdentifier: identifier, in: storyboard)
        } else {
            return instantiateInitialVC(from: storyboard)
        }
    }

    fileprivate static func instantiateInitialVC(from storyboard: UIStoryboard) -> Self {
        guard let newVC = storyboard.instantiateInitialViewController() as? Self else {
            fatalError()
        }

        return newVC
    }

    fileprivate static func instantiateVC(withIdentifier identifier: String, in storyboard: UIStoryboard) -> Self {
        guard let newVC = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError()
        }

        return newVC
    }
}

extension UIViewController: StoryboardLoadable {}
