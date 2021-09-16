//
//  DrawShadowsViewController.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 16/09/2021.
//  Copyright © 2021 Mobilee. All rights reserved.


import UIKit
import Fastlee

protocol DrawShadowsDisplayLogic: AnyObject {
	func setPresenter(_ presenter: DrawShadowsPresenterLogic)
	func didUpdateDrawShadows(_ viewModel: DrawShadowsViewModel)
	// interface for displaying results by presenter
}

class DrawShadowsViewController: UIViewController {

	private var presenter: DrawShadowsPresenterLogic?

	// MARK: IBOutlets
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var someView: UIView!
    
	// MARK: IBActions

    // MARK: View Lifesycle

	override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
    }

    // MARK: Private methods

    fileprivate func setupViews() {
        textLabel.drawShadow(with: .gray, opacity: 0.1, radius: 3.0)
        someView.layer.cornerRadius = 6.0
        someView.drawShadow(with: .gray, opacity: 0.5, radius: 5.0)
    }
}

extension DrawShadowsViewController : DrawShadowsDisplayLogic {

    func setPresenter(_ presenter: DrawShadowsPresenterLogic) {
        self.presenter = presenter
    }

    func didUpdateDrawShadows(_ viewModel: DrawShadowsViewModel) {
    	// update view with view model here...
    }
}
