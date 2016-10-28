//
//  ViewController.swift
//  EitherEnumDemo
//
//  Created by Lam Le Van on 8/2/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    static let minionCellIdentifier = "minionCell"
    
    enum MinionIndex: Int {
        case DAVE, BOB, JERRY, JORGE, KEVIN, MARK, PHIL, STUART, TIM
        static let minionNames = [
            DAVE: "Dave",
            BOB: "Bob",
            JERRY: "Jerry",
            JORGE: "Jorge",
            KEVIN: "Kevin",
            MARK: "Mark",
            PHIL: "Phil",
            STUART: "Stuart",
            TIM: "Tim"
        ]
        func minionName() -> String {
            if let minionName = MinionIndex.minionNames[self] {
                return minionName
            } else {
                return "Minion"
            }
        }
        func minionImage() -> UIImage {
            return UIImage(named: "Minion\(minionName())")!
        }
        static var count: Int {
            return MinionIndex.minionNames.count
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: ViewController.minionCellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MinionIndex.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(ViewController.minionCellIdentifier) {
            if let minionIndex = MinionIndex(rawValue: indexPath.row) {
                cell.textLabel?.text = minionIndex.minionName()
                cell.imageView?.image = minionIndex.minionImage()
            }
            return cell
        }
        return UITableViewCell()
    }
}
