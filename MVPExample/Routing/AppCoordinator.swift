//
//  AppCoordinator.swift
//  MVPExample
//
//  Created by oroom on 9/14/17.
//  Copyright © 2017 oroom. All rights reserved.
//

import Foundation
import UIKit

/// Root coordinator for application
class AppCoordinator : BaseCoordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let confugurator = AppConfiguration(configurationProvider: AuthService())
        confugurator.reconfigureApp()
        
        let taskList = TasksListViewController()
        TasksListConfiguratorImpl().configure(view: taskList)
        window.rootViewController = taskList
        window.makeKeyAndVisible()
    }
}
