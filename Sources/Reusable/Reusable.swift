//
//  Reusable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public protocol Reusable: AnyObject {
    /// Used for registering and dequeuing a reusable cell
    static var reuseIdentifier: String { get }
    static var nibName: String? { get }
    static var nib: UINib? { get }
    
    func prepareForReuse()
}

public extension Reusable {

    /// Default implementation of reuseIdentifier - take name of the class
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    static var nibName: String? {
        return String(describing: self)
    }

    static var nib: UINib? {
        let bundle = Bundle(for: self)

        if let name = nibName, bundle.path(forResource: name, ofType: "nib") != nil {
            return UINib(nibName: name, bundle: bundle)
        } else if bundle.path(forResource: reuseIdentifier, ofType: "nib") != nil {
            return UINib(nibName: reuseIdentifier, bundle: bundle)
        } else {
            return nil
        }
    }
    
    internal static var viewType: ViewTypeInitialization {
        if let nib = nib {
            return .nib(nibObject: nib)
        } else if Self.self is DesignedInStoryboard.Type {
            return .storyboard
        } else {
            return .class
        }
    }
}

extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}
//extension UICollectionViewCell: Reusable {}
extension UICollectionReusableView: Reusable {}
