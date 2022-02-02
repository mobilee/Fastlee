//
//  HomePresenter.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//  

import UIKit

protocol HomePresenterLogic: class, UITableViewDelegate & UITableViewDataSource {
	// interface for passing data from Interactor to Presenter

    func setView(_ view: HomeDisplayLogic & UIViewController)
    func viewDidLoad()
}

class HomePresenter: NSObject {

	private weak var view: (HomeDisplayLogic & UIViewController)?
    private weak var router: HomeRouter?

    private var viewModel: HomeViewModel!

    init(router: HomeRouter) {
        self.router = router

        viewModel = HomeViewModel()
    }
}

extension HomePresenter : HomePresenterLogic {

    func setView(_ view: UIViewController & HomeDisplayLogic) {
        self.view = view
    }

    func viewDidLoad() {
        // view?.didUpdateHome(viewModel)
    }
}

extension HomePresenter: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = viewModel.dataSource[indexPath.row]

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            assertionFailure("Could not dequeue reusable cell with identifier: Cell")
            return UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = model.title
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.dataSource[indexPath.row]
        
        switch model {
        case .nibLoadExample:
            router?.openNibLoadExample(from: view!)
        case .reusableCellsExample:
            router?.openReusableCellsExample(from: view!)
        case .shadows:
            router?.openDrawShadows(from: view!)
        case .showDatePicker:
            router?.openDatePicker(from: view!)
        default:
            return
        }
    }
}
