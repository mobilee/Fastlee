//
//  DashboardViewModel.swift
//  carsharing
//
//  Created by Łukasz Szarkowicz on 08/09/2022.
//

import UIKit
import Combine
import Fastlee

@available(iOS 13.0, *)
class CombineExampleViewModel: ObservableObject {
    
    private var navigation: CombineExampleNavigation
    
    @Published var text: String?
    @Published var text2: String?
    
    @Published var elementX: ElementX.ViewModel

    private var bag = Set<AnyCancellable>()
    
    init(navigation: CombineExampleNavigation) {
        self.navigation = navigation
        
        elementX = .init(title: "Text title", desc: "Some description", tfValue: "TextField content")
    }
    
    func fetchData() {

    }
    
    /**
     Mock delay to fetch some changes
     */
    func fetchTextLabel() {
        Delay.after(2.5) {
            self.text = "Test Text"
            self.text2 = "Another text"
            self.elementX = .init(title: "AAA", desc: "VVV", tfValue: "BBB")
        }
    }
    
    
    func bindText2(_ label: UILabel) {
        // Binding view model with view
        $text2.assign(to: \.text, on: label).store(in: &bag)
        
        // Another option for binding
        let sub = Subscribers.Sink<String?, Never> { completion in
            print(completion)
        } receiveValue: { value in
            print(value)
        }

        $text2.receive(subscriber: sub)
    }
}
