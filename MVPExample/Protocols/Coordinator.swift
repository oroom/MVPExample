//
//  Coordinator.swift
//  MVPExample
//
//  Created by oroom on 9/14/17.
//  Copyright © 2017 oroom. All rights reserved.
//

import Foundation

/// class which cordinates MVP modules
protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get }
    
    func append(coordinator: Coordinator)
    func remove(coordinator: Coordinator)
    func start()
}
