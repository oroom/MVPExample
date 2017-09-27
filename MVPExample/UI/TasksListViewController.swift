import UIKit

final class TasksListViewController: UIViewController, TasksListView {
    func showError() {
        // TODO: show error message
    }
    
    func showEmpty() {
        // TODO: show empty message
    }
    
    var presenter: (TasksListPresenter & BasePresenter<TasksListViewController>)?
    
    private let taskTitle = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        presenter?.attachView(view: self)
        self.setupUI()
    }

    // MARK: - TasksListView
    func showTasks(tasks: [Task]) {
        self.taskTitle.text = tasks.first?.title
    }
    
    // MARK: - Private
    private func setupUI() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.taskTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews()
        self.setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(taskTitle)
    }
    
    private func setupConstraints() {
        taskTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        taskTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

