//
//  TasksListPresenter.swift
//  MVPExample
//
//  Created by oroom on 9/18/17.
//  Copyright © 2017 oroom. All rights reserved.
//

import Foundation

final class TasksListPresenterImpl<V: TasksListView>: BasePresenter<V>, TasksListPresenter {
    
    public func getTasks() -> [Task] {
        return [Task(title: "Title", description: "Description", taskStatus: .created, createdDate: Date())]
    }
    
    override func attachView(view: V) {
        super.attachView(view: view)
        view.showTasks(tasks: getTasks())
    }
    
}


