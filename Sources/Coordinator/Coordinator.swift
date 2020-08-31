//
//  Coordinator.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

open class Coordinator: NSObject, Coordinable {
    
    deinit {
        removeAllChildCoordinators()
        print("\(self) has been deinited")
    }

    fileprivate(set) weak var parentCoordinator: Coordinator?
    public private(set) var childCoordinators: [Coordinable]

    override public init() {
        childCoordinators = []
        super.init()
        
        start()
    }
    
    open func start() {
        fatalError("Implementation for start() method not provided. Provide implementation for \(self)")
    }
    
    open func end() {
        removeAllChildCoordinators()
        parentCoordinator?.remove(coordinator: self)
    }
    
    open func presentableViewController() -> UIViewController {
        fatalError("Must override presentationController()")
    }
}

extension Coordinator {

    public func add<T: Coordinator>(coordinator: T) {
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
    }

    public func remove<T: Coordinator>(coordinator: T) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        coordinator.parentCoordinator = nil
    }
    
    /// Remove all child coordinators
    public func removeAllChildCoordinators() {
        for coord in childCoordinators {
            (coord as? Coordinator)?.end()
        }
        childCoordinators.removeAll()
        childCoordinators = []
    }
}

extension Coordinator: UIAdaptivePresentationControllerDelegate {
    
    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        self.end()
    }
}
