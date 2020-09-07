//
//  Person2View.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

class Person2View: UIView, NibLoadable {
    var contentView: UIView?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        styleView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
       	loadFromNib()
        styleView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }

    fileprivate func styleView() {
        // here put style implementation
    }
}
