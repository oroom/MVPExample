import Foundation

protocol TasksListConfigurator {
    func configure(view: TasksListViewController)
}

struct TasksListConfiguratorImpl: TasksListConfigurator {
    let appConfig: AppConfiguration
    
    init(appConfig: AppConfiguration) {
        self.appConfig = appConfig
    }
    
    func configure(view: TasksListViewController) {
        let taskService = TaskServiceImpl(tokenClosure: self.tokenClosure)
        let presenter = TasksListPresenterImpl<TasksListViewController>(taskService: taskService)
        view.presenter = presenter
    }
    
    private func tokenClosure() -> String {
        guard let token = self.appConfig.apiToken else {
            return ""
        }
        return token
    }
}
