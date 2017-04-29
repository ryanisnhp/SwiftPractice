//
//  ViewController.swift
//  HitList
//
//  Created by Le Van Lam on 4/29/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    fileprivate var names: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    @IBAction private func addName(button: UIButton) {
        let alert = UIAlertController(title: "New name", message: "Add a new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
            guard let text = alert.textFields?[0].text else { return }
            self.names.append(text)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addTextField { (textField) in
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupData() {
        
    }
    
    private func setupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}
