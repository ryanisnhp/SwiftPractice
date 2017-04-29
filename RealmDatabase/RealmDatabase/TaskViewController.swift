//
//  TaskViewController.swift
//  RealmDatabase
//
//  Created by Le Van Lam on 2/27/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit
import RealmSwift

fileprivate func < <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case (l?, r?):
        return l < r
    case (nil, _):
        return true
    default:
        return false
    }
}

fileprivate func > <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case (l?, r?):
        return l > r
    case (_, nil):
        return true
    default:
        return lhs < rhs
    }
}

class TaskViewController: UIViewController {
    
    @IBOutlet fileprivate weak var tasksTableView: UITableView!
    @IBOutlet private weak var taskLabel: UILabel!
    var selectedList: TaskList!
    var openTasks: Results<Task>!
    var completedTasks: Results<Task>!
    var currentCreateAction: UIAlertAction!
    var isEditingMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        taskLabel.text = selectedList.name
        readTasksAndUpateUI()
    }
    
    @IBAction private func didClickOnEditTasks(_ sender: UIButton) {
        isEditingMode = !isEditingMode
        tasksTableView.setEditing(isEditingMode, animated: true)
    }
    
    @IBAction private func didClickOnNewTask(_ sender: UIButton) {
        disPlayAlertToAddTask(nil)
    }
    
    fileprivate func readTasksAndUpateUI() {
        completedTasks = selectedList.task.filter("isCompleted = true")
        openTasks = selectedList.task.filter("isCompleted = false")
        tasksTableView.reloadData()
    }
    
    func disPlayAlertToAddTask(_ updatedTask: Task!) {
        var title = "New Task"
        var doneTitle = "Create"
        if updatedTask != nil {
            title = "Update Task"
            doneTitle = "Update"
        }
        let alertController = UIAlertController(title: title, message: "Write the name of your task.", preferredStyle: .alert)
        let createAction = UIAlertAction(title: doneTitle, style: .default) { (action) in
            let taskName = alertController.textFields?.first?.text
            if updatedTask != nil {
                try! uiRealm.write {
                    updatedTask.name = taskName!
                    self.readTasksAndUpateUI()
                }
            } else {
                let newTask = Task!
                newTask.name = taskName!
                try! uiRealm.write {
                    self.selectedList.task.append(newTask)
                    self.readTasksAndUpateUI()
                }
            }
            print(taskName ?? "")
        }
        alertController.addAction(createAction)
        createAction.isEnabled = false
        currentCreateAction = createAction
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addTextField { (textField) in
            textField.placeholder = "Task Name"
            textField.addTarget(self, action: #selector(taskNameFieldDidChange), for: .editingChanged)
            if updatedTask != nil {
                textField.text = updatedTask.name
            }
        }
        self.present(alertController, animated: true, completion: nil)

    }
    
    
}
