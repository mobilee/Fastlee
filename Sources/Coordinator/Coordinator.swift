//
//  Coordinator.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

open class Coordinator: NSObject, Coordinable {
    
    // MARK: - Deinit
    deinit {
        removeAllChildCoordinators()
        logInfo(message: "\(Self.coordinatorName) has been deinited: \(self)")
    }
    
    private static var coordinatorName: String {
        return String(describing: self)
    }

    /// Root view controller of Coordinator
    public var rootViewController: UIViewController? {
        return nil
    }
    
    public private(set) var childCoordinators: [Coordinable]
    
    /// Closure function used to remove coordinator from parent coordinator.
    internal var didFinish: ((Coordinator) -> Void)?

    public override init() {
        childCoordinators = []
        super.init()
    }
    
    open func start() {
        fatalError("Implementation for start() method not provided. Provide implementation for \(self)")
    }
    
    /// Use this function to end coordinator.
    open func end() {
        removeAllChildCoordinators()
        didFinish?(self)
    }
    
    open func presentableViewController() -> UIViewController {
        fatalError("Must override presentationController()")
    }
}

extension Coordinator {

    public func addCoordinator<T: Coordinator>(_ coordinator: T) {
        coordinator.didFinish = { [weak self] (coordinator) in
            self?.removeCoordinator(coordinator)
            
        }
        coordinator.start()
        childCoordinators.append(coordinator)
    }

    private func removeCoordinator<T: Coordinator>(_ coordinator: T) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
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
