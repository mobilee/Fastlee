//
//  RedViewController.swift
//  Example
//
//  Created by Łukasz Szarkowicz on 13/09/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

protocol RedNavigation: Router {
    func openBlueViewWithPush(from viewController: UIViewController)
    func openBlueViewModally(from viewController: UIViewController)
}

class RedViewController: UIViewController {
    
    weak var coordinator: RedNavigation?
    
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Red View"
        
        setup()
    }
    
    func setup() {
        view.addSubview(stackView)
        stackView.anchor(to: view, insets: .init(top: 64.0,
                                                 left: 64.0,
                                                 bottom: 64.0,
                                                 right: 64.0))
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        let button = UIButton(frame: .zero)
        button.setTitle("Press it to pass to Blue", for: .normal)
        stackView.addArrangedSubview(button)
        
        if #available(iOS 14.0, *) {
            button.addAction(.init(handler: { [weak self] action in
                guard let `self` = self else { return }
                self.coordinator?.openBlueViewWithPush(from: self)
            }), for: .touchUpInside)
        } else {
            // Fallback on earlier versions
        }
        
        let buttonModal = UIButton(frame: .zero)
        buttonModal.setTitle("Press it to open Blue modally", for: .normal)
        stackView.addArrangedSubview(buttonModal)
        
        if #available(iOS 14.0, *) {
            buttonModal.addAction(.init(handler: { [weak self] action in
                guard let `self` = self else { return }
                self.coordinator?.openBlueViewModally(from: self)
            }), for: .touchUpInside)
        } else {
            // Fallback on earlier versions
        }
    }
}
