//
//  AppCoordinator.swift
//  MVPExample
//
//  Created by oroom on 9/14/17.
//  Copyright © 2017 oroom. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator : BaseCoordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let taskList = TasksListViewController()
        TasksListConfiguratorImpl().configure(view: taskList)
        window.rootViewController = taskList
        window.makeKeyAndVisible()
    }
}
