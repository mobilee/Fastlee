//
//  DrawShadowsModule.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 16/09/2021.
//  Copyright © 2021 Mobilee. All rights reserved.
//

import UIKit

class DrawShadowsModule {

	class func build(for routing: DrawShadowsRouter) -> DrawShadowsViewController {

		let view = DrawShadowsViewController.instantiate()
		view.title = "DrawShadows"
		
		let interactor = DrawShadowsInteractor()
		let presenter = DrawShadowsPresenter(interactor: interactor, router: routing)

		interactor.presenter = presenter
		presenter.setView(view)
		view.setPresenter(presenter)

		return view
	}
}
