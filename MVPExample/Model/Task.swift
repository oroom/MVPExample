import Foundation

/// Task status
/// Task status
enum TaskStatus: Int, Codable {
    case created
    case completed
    case inProgress
}

/// Model representing single task
struct Task: Codable {
    let title: String
    let description: String
    let status: TaskStatus
    let updated: Date
}

struct TasksList: Codable {
    let items: [Task]
}

struct TasksPage: Codable {
    let className: String
    let skip: Int
    let limit: Int
    let items: [Task]
    
    enum CodingKeys: String, CodingKey {
        case className = "class_name"
        case skip
        case limit
        case items
    }
}
