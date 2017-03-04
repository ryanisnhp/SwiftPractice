//
//  ProfileViewController.swift
//  MVVMDemo3
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileViewModel: ProfileViewModel!
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        let profile = Profile()
        profileViewModel = ProfileViewModel(profile: profile)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func cellForTimeSectionForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell {
            cell.configCell(profileViewModel: profileViewModel)
            return cell
        }
        return UITableViewCell()
    }

}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return profileViewModel.sectionNumbers
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileViewModel.numberOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return profileViewModel.titleForHeader(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let section = ProfileSection(rawValue: indexPath.section)
        if section == .time {
            return cellForTimeSectionForRowAtIndexPath(indexPath)
        }
        return UITableViewCell()
    }
}
