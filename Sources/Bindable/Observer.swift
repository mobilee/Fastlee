//
//  Observer.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 12/04/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import Foundation
import Combine

@available(iOS 13.0, *)
public protocol Observer: ComponentUI {
    
    func observe(_ publisher: Published<ViewModel>.Publisher, storeIn bag: inout Set<AnyCancellable>)
    func observe(_ publisher: AnyPublisher<ViewModel, Never>, storeIn bag: inout Set<AnyCancellable>)
    func observe(_ subject: CurrentValueSubject<ViewModel, Never>, storeIn bag: inout Set<AnyCancellable>)
}

@available(iOS 13.0, *)
public extension Observer {
    
    func observe(_ publisher: Published<ViewModel>.Publisher, storeIn bag: inout Set<AnyCancellable>) {
        observe(publisher.eraseToAnyPublisher(), storeIn: &bag)
    }
    
    func observe(_ subject: CurrentValueSubject<ViewModel, Never>, storeIn bag: inout Set<AnyCancellable>) {
        observe(subject.eraseToAnyPublisher(), storeIn: &bag)
    }
    
    func observe(_ publisher: AnyPublisher<ViewModel, Never>, storeIn bag: inout Set<AnyCancellable>) {
        publisher
            .receive(on: RunLoop.main)
            .sink { [weak self] model in
                self?.update(with: model)
            }.store(in: &bag)
    }
}

