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
        confugurator.reconfigureApp(completion: {
            let taskList = TasksListViewController()
            TasksListConfiguratorImpl(appConfig: confugurator).configure(view: taskList)
            self.window.rootViewController = taskList
            self.window.makeKeyAndVisible()
        })
    }
}
