import Foundation

final class TasksListPresenterImpl<V: TasksListView>: BasePresenter<V>, TasksListPresenter {
    
    let taskService: TaskService
    
    init(taskService: TaskService) {
        self.taskService = taskService
        super.init()
    }

    public func getTasks() {
        taskService.getTasks(completion: self.process)
    }
    
    private func process(tasks: [Task]?) {
        if let tasks = tasks {
            if tasks.count == 0 {
                view.showEmpty()
            }
            else {
                view.showTasks(tasks: tasks)
            }
        }
        else {
            view.showError()
        }
    }
    
    override func attachView(view: V) {
        super.attachView(view: view)
        getTasks()
    }
}
