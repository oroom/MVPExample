//
//  TasksListBuilder.swift
//  MVPExample
//
//  Created by oroom on 9/18/17.
//  Copyright © 2017 oroom. All rights reserved.
//

import Foundation

protocol TasksListConfigurator {
    func configure(view: TasksListViewController)
}

struct TasksListConfiguratorImpl: TasksListConfigurator {
    func configure(view: TasksListViewController) {
        let presenter = TasksListPresenterImpl<TasksListViewController>()
        view.presenter = presenter
    }
}

