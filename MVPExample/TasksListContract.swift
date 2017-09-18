//
//  TasksListContract.swift
//  MVPExample
//
//  Created by oroom on 9/18/17.
//  Copyright © 2017 oroom. All rights reserved.
//

import Foundation

protocol TasksListView : View {
    func showTasks(tasks: [Task])
}

protocol TasksListPresenter {
    func getTasks() -> [Task]
}
