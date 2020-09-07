//
//  Person3View.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

class Person3View: UIView, HasNib {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        styleView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
       	
        styleView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }

    fileprivate func styleView() {
        // here put style implementation
    }
}
