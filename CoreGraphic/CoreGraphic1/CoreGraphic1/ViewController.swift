//
//  ViewController.swift
//  CoreGraphic1
//
//  Created by Lam Le Van on 12/21/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: HomeCell.identifier, bundle: nil), forCellReuseIdentifier: HomeCell.identifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HomeCell.height
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell {
            return cell
        }
        return UITableViewCell()
    }
}
