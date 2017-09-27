import Foundation

protocol TasksListView : View {
    func showTasks(tasks: [Task])
    func showError()
    func showEmpty()
}

protocol TasksListPresenter {
    func getTasks()
}
