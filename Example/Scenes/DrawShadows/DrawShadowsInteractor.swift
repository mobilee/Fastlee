//
//  DrawShadowsInteractor.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 16/09/2021.
//  Copyright © 2021 Mobilee. All rights reserved.
//

import Foundation

protocol DrawShadowsInteractorLogic: AnyObject {
	// interface of Interactor

	func fetchData()
}

protocol DrawShadowsDataStore: AnyObject {
    // interface for stored data
}

class DrawShadowsInteractor: DrawShadowsDataStore {
	weak var presenter: DrawShadowsInteractorPresenterProtocol?
        
}

extension DrawShadowsInteractor: DrawShadowsInteractorLogic {

	func fetchData() {
		// self.presenter? -> update presenter with results
	}
}
