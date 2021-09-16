//
//  DrawShadowsPresenter.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 16/09/2021.
//  Copyright © 2021 Mobilee. All rights reserved.
//  

import UIKit

protocol DrawShadowsInteractorPresenterProtocol: AnyObject {
    // communication interface from Interactor to Presenter
}

protocol DrawShadowsPresenterLogic: AnyObject {
	// interface for passing data from Interactor to Presenter

    func setView(_ view: DrawShadowsDisplayLogic & UIViewController)
    func viewDidLoad()
}

class DrawShadowsPresenter {

	private weak var view: (DrawShadowsDisplayLogic & UIViewController)?
    private let interactor: DrawShadowsInteractorLogic
    private weak var router: DrawShadowsRouter?

    private var viewModel: DrawShadowsViewModel!

    init(interactor: DrawShadowsInteractorLogic,
         router: DrawShadowsRouter) {

        self.interactor = interactor
        self.router = router

        viewModel = DrawShadowsViewModel()
    }
}

extension DrawShadowsPresenter : DrawShadowsPresenterLogic {

    func setView(_ view: UIViewController & DrawShadowsDisplayLogic) {
        self.view = view
    }

    func viewDidLoad() {
        // view?.didUpdateDrawShadows(viewModel)
    }
}

extension DrawShadowsPresenter : DrawShadowsInteractorPresenterProtocol {
    
}
