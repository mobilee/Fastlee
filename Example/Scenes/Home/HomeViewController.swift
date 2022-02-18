//
//  HomeViewController.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.


import UIKit
import Fastlee

protocol HomeDisplayLogic: class {
	func setPresenter(_ presenter: HomePresenterLogic)
	func didUpdateHome(_ viewModel: HomeViewModel)
	// interface for displaying results by presenter
}

class HomeViewController: UIViewController {

	private var presenter: HomePresenterLogic?

	// MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
	// MARK: IBActions

    // MARK: View Lifesycle

	override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter?.viewDidLoad()
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        logWarning(message: "This is example warning")
    }

    // MARK: Private methods

    fileprivate func setupViews() {
        createBarButton()
    }
    
    func createBarButton() {
        if #available(iOS 13.0, *) {
            let button = UIBarButtonItem.create(with: UIImage(systemName: "pin")!, title: "Long Click it!", order: .imageRight, target: self, action: #selector(buttonHandler))
            navigationItem.rightBarButtonItem = button
        } else {
            // Fallback on earlier versions
        }
    }
    
    @objc func buttonHandler() {
        print("Button touched")
    }

}


extension HomeViewController : HomeDisplayLogic {

    func setPresenter(_ presenter: HomePresenterLogic) {
        self.presenter = presenter
    }

    func didUpdateHome(_ viewModel: HomeViewModel) {
    	// update view with view model here...
    }
}
