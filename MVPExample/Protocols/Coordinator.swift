import Foundation

/// class which cordinates MVP modules
protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get }
    
    func append(coordinator: Coordinator)
    func remove(coordinator: Coordinator)
    func start()
}
