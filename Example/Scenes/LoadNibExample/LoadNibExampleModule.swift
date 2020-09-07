//
//  LoadNibExampleModule.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit
import Fastlee

class LoadNibExampleModule {

	class func build(for routing: LoadNibExampleRouter) -> LoadNibExampleViewController {

		let view = LoadNibExampleViewController.instantiate()
		view.title = "LoadNib Example"
		let presenter = LoadNibExamplePresenter(router: routing)
		presenter.setView(view)
		view.setPresenter(presenter)

		return view
	}
}
