//
//  LoadNibExamplePresenter.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//  

import UIKit

protocol LoadNibExamplePresenterLogic: class {
	// interface for passing data from Interactor to Presenter

    func setView(_ view: LoadNibExampleDisplayLogic & UIViewController)
    func viewDidLoad()
}

class LoadNibExamplePresenter {

	private weak var view: (LoadNibExampleDisplayLogic & UIViewController)?
    private weak var router: LoadNibExampleRouter?

    private var viewModel: LoadNibExampleViewModel!

    init(router: LoadNibExampleRouter) {
        self.router = router

        viewModel = LoadNibExampleViewModel()
    }
}

extension LoadNibExamplePresenter : LoadNibExamplePresenterLogic {

    func setView(_ view: UIViewController & LoadNibExampleDisplayLogic) {
        self.view = view
    }

    func viewDidLoad() {
        // view?.didUpdateLoadNibExample(viewModel)
    }
}
