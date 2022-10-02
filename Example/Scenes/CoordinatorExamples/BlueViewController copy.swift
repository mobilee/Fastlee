//
//  BlueViewController.swift
//  Example
//
//  Created by Łukasz Szarkowicz on 13/09/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

protocol BlueNavigation: Router {
    func openGreenView(from viewController: UIViewController)
}

class BlueViewController: UIViewController {
    weak var coordinator: BlueNavigation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Blue View"
        
        setup()
    }
    
    func setup() {
        let button = UIButton(frame: .zero)
        button.setTitle("Press it to go to the green", for: .normal)
        view.addSubview(button)
        button.anchor(to: view)
        
        if #available(iOS 14.0, *) {
            button.addAction(.init(handler: { [weak self] action in
                guard let `self` = self else { return }
                self.coordinator?.openGreenView(from: self)
            }), for: .touchUpInside)
        } else {
            // Fallback on earlier versions
        }
    }
}
