import UIKit

final class TasksListViewController: UIViewController, TasksListView {
    
    var presenter: (TasksListPresenter & BasePresenter<TasksListViewController>)?
    let cellsReuseIdentifier = "tasksCell"
    private var adapter: TasksListCollectionViewAdapter!
    private var tasksList: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        presenter?.attachView(view: self)
        self.setupUI()
        
        let taskSelected: (Task) -> () = { [weak self] task in
            self?.presenter?.taskSelected(task: task)
        }
        adapter = TasksListCollectionViewAdapter(taskSelected: taskSelected, reuseIdentifier: cellsReuseIdentifier)
        tasksList.delegate = adapter
        tasksList.dataSource = adapter
    }

    // MARK: - TasksListView
    func showTasks(tasks: [Task]) {
        adapter.items = tasks
        self.tasksList.reloadData()
    }
    
    func showError() {
        // TODO: show error message
    }
    
    func showEmpty() {
        // TODO: show empty message
    }
    
    // MARK: - Private
    private func setupUI() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: self.view.frame.width - 32, height: 50)
        flowLayout.minimumLineSpacing = 5
        tasksList = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        tasksList.register(TaskCell.self, forCellWithReuseIdentifier: cellsReuseIdentifier)
        tasksList.backgroundColor = UIColor.lightGray
        self.view.backgroundColor = UIColor.lightGray
        
        self.addSubviews()
        self.setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(tasksList)
    }
    
    private func setupConstraints() {
        tasksList.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tasksList.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tasksList.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tasksList.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
}
