//
//  Task.swift
//  MVPExample
//
//  Created by oroom on 9/18/17.
//  Copyright © 2017 oroom. All rights reserved.
//

import Foundation

/// Task status
enum TaskStatus {
    case Created
    case Completed
    case InProgress
}


/// Model representing single task
struct Task {
    let title: String
    let description: String
    let taskStatus: TaskStatus
    let createdDate: Date
}
