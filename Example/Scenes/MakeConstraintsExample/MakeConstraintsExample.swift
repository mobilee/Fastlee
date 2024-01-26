//
//  MakeConstraintsExample.swift
//  Example
//
//  Created by Łukasz Szarkowicz on 03/07/2023.
//  Copyright © 2023 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

class MakeConstraintsExample: UIViewController {
    
    var redView: UIView = UIView()
    var blueView: UIView = UIView()
    var greenView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        greenView.backgroundColor = .green
        
        makeConstraints7()
    }
    
    func makeConstraints1() {
        view.addSubview(redView)
        let insets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        redView.constraintsEqual(to: view, insets: insets).activateAll()
    }
    
    func makeConstraints2() {
        view.addSubview(redView)
        redView.addSubview(blueView)
        blueView.addSubview(greenView)

        
        let insets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        (redView.constraintsEqual(to: view, insets: insets)
        + blueView.constraintsEqual(to: redView, insets: insets)
        + greenView.constraintsEqual(to: blueView, insets: insets)).activateAll()
    }
    
    func makeConstraints3() {
        // Example of mixing arrays of constraints with singular constraint.
        view.addSubview(redView)
        redView.addSubview(blueView)
        blueView.addSubview(greenView)
        
        let constr = redView.constraintsEqual(to: view)
        + greenView.widthAnchor.constraint(equalToConstant: 30)
        + blueView.constraintsEqual(to: redView)
        
        constr.activateAll()
    }
    
    func makeConstraints4() {
        view.addSubview(redView)
        
        redView.constraintsEqual(to: view.safeAreaLayoutGuide).activateAll()
    }
    
    func makeConstraints5() {
        view.addSubview(redView)
        redView.addSubview(blueView)
        
        
        (blueView.constraintsEqual(to: view, insets: .init(top: 32, left: 32, bottom: 32, right: 32))
         + redView.constraintsEqual(to: view, insets: .init(top: 16, left: 16, bottom: 16, right: 16))).activateAll()
    }
    
    func makeConstraints6() {
        view.addSubview(redView)
        redView.addSubview(blueView)
        
        // Error with using old anchor
        blueView.anchor(to: view, insets: .init(top: 32, left: 32, bottom: 32, right: 32))
        redView.anchor(to: view, insets: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    func makeConstraints7() {
        view.addSubview(redView)
        redView.addSubview(blueView)
        
        redView.constraintsTo(width: view.widthAnchor,
                              widthMultiplier: 0.7,
                              height: view.heightAnchor,
                              heightMultiplier: 0.5).activateAll()
    }
    
    
}
