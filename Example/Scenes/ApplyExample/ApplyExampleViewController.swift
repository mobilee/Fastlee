//
//  ApplyExampleViewController.swift
//  Example
//
//  Created by Lukasz Szarkowicz on 08/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

class ApplyExampleViewController: UIViewController {

    @IBOutlet weak var label1: MyLabel!
    @IBOutlet weak var image1: MyImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.apply(using: .redColoured)
        label1.apply { (label) in
            label.backgroundColor = .red
        }
        
//        UILabel().applyStyle
//            .roundedCorner()
//            .commonSettings()
//        label1.applyStyle.roundedCorner().commonSettings()
//        image1.applyStyle.anyCorner()
//        label1.applyStyle.roundedCorner()
        
    }
}

class MyLabel: UILabel {}
class MyImage: UIImageView {}

extension Applyer where Element: UILabel {

    static var redColoured: Applyer<Element> {
        return .init { (label) in
            label.backgroundColor = .red
        }
    }
}

//extension Style where Base: UIView {
//    func commonSettings() {
//        self.base.backgroundColor = .red
//    }
//}
//
//extension Style where Base: UILabel {
//    @discardableResult
//    func roundedCorner() -> Style {
//        self.base.layer.cornerRadius = 10
//        return self
//    }
//}
//
//extension Style where Base: UIImageView {
//    @discardableResult
//    func anyCorner() -> Style {
//        self.base.layer.cornerRadius = 10
//        return self
//    }
//}


