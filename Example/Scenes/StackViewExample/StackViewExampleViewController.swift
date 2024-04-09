//
//  StackViewExampleViewController.swift
//  Example
//
//  Created by Łukasz Szarkowicz on 04/07/2023.
//  Copyright © 2023 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

class StackViewExampleViewController: UIViewController {
 
    var stackView: ScrollableStackView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.add(stackView)
        stackView.constraintsEqual(to: view.safeAreaLayoutGuide).activateAll()
        
        stackView.backgroundColor = .green
        stackView.stackView.backgroundColor = .blue
        stackView.scrollView.backgroundColor = .yellow
        
        let label = UILabel()
        label.text = "Test text lorem ipsum, Test text lorem ipsum, Test text lorem ipsum"
        label.numberOfLines = 0
        
        let labelDown = UILabel()
        labelDown.text = "Down text lorem ipsum, Down text lorem ipsum, Down text lorem ipsum"
        labelDown.numberOfLines = 0
        
        let insets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        stackView.addArrangedSubview(label.embedded(with: insets))
        stackView.addArrangedSubview(.spacer())
        stackView.addArrangedSubview(labelDown.embedded(with: insets))
    }
}
