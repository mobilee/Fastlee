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
public protocol Observer: AnyObject {
    associatedtype ViewModel
    func bind(to publisher: Published<ViewModel>.Publisher, storeIn bag: inout Set<AnyCancellable>)
    func bind(to publisher: AnyPublisher<ViewModel, Never>, storeIn bag: inout Set<AnyCancellable>)
    func bind(to subject: CurrentValueSubject<ViewModel, Never>, storeIn bag: inout Set<AnyCancellable>)
}
