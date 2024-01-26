//
//  CombineExampleViewController.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 23/01/2024.
//  Copyright © 2024 Mobilee. All rights reserved.

import UIKit
import Combine
import Fastlee

@available(iOS 13.0, *)
class CombineExampleViewController: UIViewController {
    // MARK: - Types
    typealias ViewModel = CombineExampleViewModel

    // MARK: - Properties
    var viewModel: ViewModel!
    
    private var bag = Set<AnyCancellable>()
    
    // MARK: - Views
    private let stackView = ScrollableStackView()
    let text = UILabel()
    let text2 = UILabel()
    let elementX = ElementX()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModelToView()
        
        viewModel.fetchTextLabel()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.add(stackView)
        stackView.anchor(to: view.safeAreaLayoutGuide)
        
        stackView.addArrangedSubviews(text, text2, elementX)
        
        

    }
    
    private func bindViewModelToView() {
        guard let viewModel = viewModel else { return }
        
        bindTextLabel()
        viewModel.bindText2(text2)
        
        viewModel.$elementX.receive(subscriber: elementX)
    }
    
    private func bindTextLabel() {
        // Important! Add [unowned self] in sink closure to avoid retain cycle.
        viewModel.$text.sink { [unowned self] model in
            self.text.text = model
        }.store(in: &bag)
    }
}
