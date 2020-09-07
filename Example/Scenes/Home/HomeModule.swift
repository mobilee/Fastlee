//
//  HomeModule.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

class HomeModule {

	class func build(for routing: HomeRouter) -> HomeViewController {

		let view = HomeViewController.instantiate()
		view.title = "Fastlee Example"
		
		let presenter = HomePresenter(router: routing)
		presenter.setView(view)
		view.setPresenter(presenter)

		return view
	}
}
