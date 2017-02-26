//
//  ViewController.swift
//  RealmDatabase
//
//  Created by Le Van Lam on 2/26/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet private weak var taskListsLabel: UILabel!
    @IBOutlet private weak var taskListTableView: UITableView!
    var lists: Results<TaskList>!
    var isEditingMode = false
    var currentCreatAction: UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        readTaskAndUpdateUI()
    }
    
    private func setUpUI() {
        taskListsLabel.text = "Task Lists"
        taskListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "listCell")
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction private func editButtonClicked(button: UIButton) {
        isEditingMode = !isEditingMode
        taskListTableView.setEditing(isEditingMode, animated: true)
    }
    
    @IBAction private func addButtonClicked(button: UIButton) {
        
    }
    @IBAction func segmentedClicked(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // A-Z
            lists = lists.sorted(byKeyPath: "name")
        } else {
            //date
            lists = lists.sorted(byKeyPath: "date", ascending: false)
        }
        taskListTableView.reloadData()
    }
    
    private func readTaskAndUpdateUI() {
        lists = uiRealm.objects(TaskList.self) //Register
        taskListTableView.setEditing(false, animated: true)
        taskListTableView.reloadData()
    }
    
    fileprivate func displayAlertToAddList(_ updateList: TaskList!) {
        var title = "New Tasks List"
        var doneTitle = "Create"
        if updateList != nil {
            title = "Update Tasks List"
            doneTitle = "Update"
        }
        
        let alertController = UIAlertController(title: title, message: "Write the name of your tasks list", preferredStyle: .alert)
        let createAction = UIAlertAction(title: doneTitle, style: .default) { (action) in
            let listName = alertController.textFields?.first?.text
            if updateList != nil {
                //update mode
                try! uiRealm.write {
                    updateList.name = listName!
                    self.readTaskAndUpdateUI()
                }
            } else {
                let newTaskList = TaskList()
                newTaskList.name = listName!
                try! uiRealm.write {
                    uiRealm.add(newTaskList)
                    self.readTaskAndUpdateUI()
                }
            }
            print(listName ?? "")
        }
        alertController.addAction(createAction)
        createAction.isEnabled = false
        currentCreatAction = createAction
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addTextField { (textField) in
            textField.placeholder = "Task List Name"
            textField.addTarget(self, action: #selector(self.listNameFieldDidChange), for: .editingChanged)
            if updateList != nil {
                textField.text = updateList.name
            }
        }
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func listNameFieldDidChange(textField: UITextField) {
        currentCreatAction.isEnabled = (textField.text?.characters.count)! > 0
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let lists = lists {
            return lists.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell")
        let list = lists[indexPath.row]
        cell?.textLabel?.text = list.name
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (deleteAction, indexPath) in
            //Deletion will go here
            let listToBeDeleted = lists[indexPath.row]
            try! uiRealm.write {
                uiRealm.delete(listToBeDeleted)
                self.readTasksAndUpdateUI()
            }
        }
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (editAction, indexPath) in
            
            //Editting will go here
            let listToBeUpdated = self.lists[indexPath.row]
            self.displayAlertToAddList(listToBeUpdated)
        }
        return [deleteAction, editAction]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
