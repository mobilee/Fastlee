//
//  AtomicUIComponent.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 12/04/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import Foundation
import Combine

@available(iOS 14.0, *)
public protocol AtomicUIComponent: UIComponent {
    associatedtype ViewModel
    var bindablePublisher: AnyPublisher<ViewModel, Never> { get }
    
    func bind(to publishedValue: inout Published<ViewModel>.Publisher, storeIn bag: inout Set<AnyCancellable>)
    func bind(to subject: CurrentValueSubject<String?, Never>, storeIn bag: inout Set<AnyCancellable>)
}

@available(iOS 14.0, *)
public extension AtomicUIComponent {
    func bind(to publishedValue: inout Published<ViewModel>.Publisher, storeIn bag: inout Set<AnyCancellable>) {
        bind(to: publishedValue.eraseToAnyPublisher(), storeIn: &bag)
        bindablePublisher.assign(to: &publishedValue)
    }
    
    func bind(to subject: CurrentValueSubject<ViewModel, Never>, storeIn bag: inout Set<AnyCancellable>) {
        bind(to: subject.eraseToAnyPublisher(), storeIn: &bag)
        bindablePublisher.sink { value in
            subject.send(value)
        }.store(in: &bag)
    }
}
