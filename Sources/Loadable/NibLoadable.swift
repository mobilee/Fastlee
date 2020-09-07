//
//  NibLoadable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

/**
 NibLoadable protocol makes it easy to create new UIView's subview.
 
 Execute `loadFromNib` func in `init(frame: CGRect)` and `init?(coder aDecoder: NSCoder)` to create view properly.
 
 - requires: In XIB file set File's Owner into the UIView's subclass.
*/
public protocol NibLoadable: HasNib {

    var contentView: UIView? { get set }
}

public extension NibLoadable where Self: UIView {
    
    /**
     Loads UIView subclasses contained in Nib file.
     
     - requires: Use it in `init(frame: CGRect)` and `init?(coder aDecoder: NSCoder)` to create view properly.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func loadFromNib() {
        let viewsInNib = Self.nib.instantiate(withOwner: self, options: nil).compactMap { $0 as? UIView }

        for element in viewsInNib {
            setupLayout(for: element)
        }

        contentView = viewsInNib.first
    }

    fileprivate func setupLayout(for view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        let attributes: [NSLayoutConstraint.Attribute] = [.top, .trailing, .bottom, .leading]

        let constraints = attributes.map({ attr -> NSLayoutConstraint in
            return NSLayoutConstraint(item: view,
                                      attribute: attr,
                                      relatedBy: .equal,
                                      toItem: self,
                                      attribute: attr,
                                      multiplier: 1.0,
                                      constant: 0.0)
        })

        NSLayoutConstraint.activate(constraints)
    }
}
