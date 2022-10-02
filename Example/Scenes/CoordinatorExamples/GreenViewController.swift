//
//  GreenViewController.swift
//  Example
//
//  Created by Łukasz Szarkowicz on 13/09/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

protocol GreenNavigation: Router {
    func selectEndProcess(from viewController: UIViewController)
}

class GreenViewController: UIViewController {
    weak var coordinator: GreenNavigation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Green View"
        
        setup()
    }
    
    func setup() {
        let button = UIButton(frame: .zero)
        button.setTitle("Press it to go to the beginning", for: .normal)
        view.addSubview(button)
        button.anchor(to: view)
        
        if #available(iOS 14.0, *) {
            button.addAction(.init(handler: { [weak self] action in
                guard let `self` = self else { return }
                self.coordinator?.selectEndProcess(from: self)
            }), for: .touchUpInside)
        } else {
            // Fallback on earlier versions
        }
    }
}
