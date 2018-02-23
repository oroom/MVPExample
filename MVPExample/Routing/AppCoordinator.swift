import Foundation

/// Root coordinator for application
class AppCoordinator : BaseCoordinator {
    
    let router: AppRouter
    
    init(router: AppRouter) {
        self.router = router
    }
    
    override func start() {
        let confugurator = AppConfiguration(configurationProvider: AuthService())
        confugurator.reconfigureApp(completion: {
            let taskList = TasksListViewController()
            TasksListConfiguratorImpl(appConfig: confugurator).configure(view: taskList)
            self.router.showInWindow(viewController: taskList)
        })
    }
}
