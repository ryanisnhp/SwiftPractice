//
//  ViewController.swift
//  RestFulDemo
//
//  Created by Lam Le Van on 6/2/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

private let cellIdentifier = "cell"

class ViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    private var items: [UserInfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction private func addUserIsClicked(button: UIButton) {
        RestAPIManager.sharedInstance.getRandomUser { (json) -> Void in
            print(json)
            if let jsonArray = json["results"].array {
                print(jsonArray)
                for jsonUnit in jsonArray {
                    self.items.append(UserInfo(json: jsonUnit))
                }
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let userInfo = self.items[indexPath.row]
        cell.textLabel?.text = userInfo.getUsername()
        cell.imageView?.image = userInfo.getPicture()
        return cell
    }
    
}