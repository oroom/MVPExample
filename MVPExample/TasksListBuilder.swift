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
        //Type erasure used to clean type information
        let presenter = TasksListPresenterImpl<TasksListViewController>()
        let viewPresenter = AnyPresenter(presenter: presenter)
        view.presenter = presenter
        view.viewPresenter = viewPresenter
    }
}

