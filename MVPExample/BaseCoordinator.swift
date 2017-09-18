//
//  BaseCoordinator.swift
//  MVPExample
//
//  Created by oroom on 9/14/17.
//  Copyright © 2017 oroom. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    public func append(coordinator: Coordinator) {
        guard childCoordinators.filter({ $0 === coordinator }).isEmpty else {
            return
        }
        
        childCoordinators.append(coordinator)
    }
    
    public func remove(coordinator: Coordinator) {
        guard childCoordinators.isEmpty == false,
              let indexToRemove = childCoordinators.index(where: { $0 === coordinator }) else {
            return
        }
        
        childCoordinators.remove(at: indexToRemove)
    }
    
    public func start() {}
}
