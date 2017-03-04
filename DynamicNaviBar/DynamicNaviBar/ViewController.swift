//
//  ViewController.swift
//  DynamicNaviBar
//
//  Created by Le Van Lam on 3/3/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit
import AMScrollingNavbar

enum ScrollViewState {
    case up, down, still
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var naviBarView: UIView!
    @IBOutlet private weak var heightConstraint: NSLayoutConstraint!
    
    var scrollViewState: ScrollViewState = .still
    var scrollState:((ScrollViewState) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.addObserver(self, forKeyPath: "contentOffset", options: [.new, .old], context: nil)
        naviBarView.translatesAutoresizingMaskIntoConstraints = false
        scrollState = { state in
            if state == .up {
                self.heightConstraint.constant = 0
                UIView.animate(withDuration: 10.0, animations: {
                    self.naviBarView.layoutIfNeeded()
                }, completion: { (finished) in
                    
                })
            } else if state == .down {
                self.heightConstraint.constant = 80.0
                UIView.animate(withDuration: 10.0, animations: {
                    self.naviBarView.layoutIfNeeded()
                }, completion: { (finished) in
                    
                })
            } else {
                
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentOffset" {
            guard let newContentOffset = change?[.newKey] as? CGPoint,
                let oldContentOffset = change?[.oldKey] as? CGPoint else { return }
            let delta = newContentOffset.y - oldContentOffset.y
            if delta == 0 {
                scrollViewState = .still
            } else if delta > 0 {
                scrollViewState = .up
            } else {
                scrollViewState = .down
            }
            scrollState?(scrollViewState)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "\(indexPath.row)"
        return cell!
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
}
