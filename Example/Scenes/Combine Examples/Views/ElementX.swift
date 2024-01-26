//
//  ElementX.swift
//  Example
//
//  Created by Łukasz Szarkowicz on 24/01/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import UIKit
import Fastlee
import Combine

@available(iOS 13.0, *)
class ElementX: UIView {
    
    let title = UILabel()
    let desc = UILabel()
    var textfield = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        logInfo(message: "Run setup")
        
        let stack = UIStackView(arrangedSubviews: [title, desc, textfield])
        stack.axis = .vertical
        stack.embedded(in: self, with: .same(8.0))
        
        
        
    }
    
    @MainActor
    func update(with viewModel: ViewModel) {
        title.text = viewModel.title
        desc.text = viewModel.desc
        textfield.text = viewModel.tfValue
    }
}

@available(iOS 13.0, *)
extension ElementX: Subscriber {
    typealias Input = ViewModel
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
    func receive(_ input: ViewModel) -> Subscribers.Demand {
        self.update(with: input)
        
        return .unlimited
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        switch completion {
        case .finished:
            logInfo(message: "End subscription")
        case .failure(let failure):
            logError(message: failure.localizedDescription)
        }
    }
    
    
}

@available(iOS 13.0, *)
extension ElementX {
    class ViewModel: ObservableObject {
        
        @Published var title: String
        @Published var desc: String
        @Published var tfValue: String
        
        init(title: String, desc: String, tfValue: String) {
            self.title = title
            self.desc = desc
            self.tfValue = tfValue
        }
    }
}

@available(iOS 13.0, *)
extension ElementX.ViewModel: Subscriber {
    typealias Input = ElementX
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
    func receive(_ input: ElementX) -> Subscribers.Demand {
        
        return .unlimited
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        
    }
    
    
}
