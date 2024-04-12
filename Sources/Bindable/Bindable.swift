//
//  Bindable.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 12/04/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import Foundation
import Combine

@available(iOS 14.0, *)
public protocol Bindable: Observer {
    
    var bindablePublisher: AnyPublisher<ViewModel, Never> { get }
    
    func bind(with publishedValue: inout Published<ViewModel>.Publisher, storeIn bag: inout Set<AnyCancellable>)
    func bind(with subject: CurrentValueSubject<String?, Never>, storeIn bag: inout Set<AnyCancellable>)
}

@available(iOS 14.0, *)
public extension Bindable {
    func bind(with publishedValue: inout Published<ViewModel>.Publisher, storeIn bag: inout Set<AnyCancellable>) {
        observe(publishedValue.eraseToAnyPublisher(), storeIn: &bag)
        bindablePublisher.assign(to: &publishedValue)
    }
    
    func bind(with subject: CurrentValueSubject<ViewModel, Never>, storeIn bag: inout Set<AnyCancellable>) {
        observe(subject.eraseToAnyPublisher(), storeIn: &bag)
        bindablePublisher.sink { value in
            subject.send(value)
        }.store(in: &bag)
    }
}
