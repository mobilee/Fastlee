//
//  LoadNibExampleViewController.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.


import UIKit

protocol LoadNibExampleDisplayLogic: class {
	func setPresenter(_ presenter: LoadNibExamplePresenterLogic)
	func didUpdateLoadNibExample(_ viewModel: LoadNibExampleViewModel)
	// interface for displaying results by presenter
}

class LoadNibExampleViewController: UIViewController {

	private var presenter: LoadNibExamplePresenterLogic?

	// MARK: IBOutlets
    @IBOutlet weak var personFromStoryboard: PersonView!
    @IBOutlet weak var emptyView: UIView!
    
	// MARK: IBActions

    // MARK: View Lifesycle

	override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter?.viewDidLoad()
        
        personFromStoryboard.nameLabel.text = "Johny!"
        
        let otherView = Person3View.loadFromNib()
        emptyView.add(otherView)
    }

    // MARK: Private methods

    fileprivate func setupViews() {

    }

}


extension LoadNibExampleViewController : LoadNibExampleDisplayLogic {

    func setPresenter(_ presenter: LoadNibExamplePresenterLogic) {
        self.presenter = presenter
    }

    func didUpdateLoadNibExample(_ viewModel: LoadNibExampleViewModel) {
    	// update view with view model here...
    }
}
