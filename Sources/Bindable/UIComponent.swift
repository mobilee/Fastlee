//
//  UIComponent.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 12/04/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import Foundation
import Combine

@available(iOS 13.0, *)
public protocol UIComponent: Observer {
    associatedtype ViewModel
    func update(with viewModel: ViewModel)
}

@available(iOS 13.0, *)
public extension UIComponent {

    func bind(to publisher: Published<ViewModel>.Publisher, storeIn bag: inout Set<AnyCancellable>) {
        bind(to: publisher.eraseToAnyPublisher(), storeIn: &bag)
    }
    
    func bind(to subject: CurrentValueSubject<ViewModel, Never>, storeIn bag: inout Set<AnyCancellable>) {
        bind(to: subject.eraseToAnyPublisher(), storeIn: &bag)
    }
    
    func bind(to publisher: AnyPublisher<ViewModel, Never>, storeIn bag: inout Set<AnyCancellable>) {
        publisher
            .receive(on: RunLoop.main)
            .sink { [weak self] model in
                self?.update(with: model)
            }.store(in: &bag)
    }
}
