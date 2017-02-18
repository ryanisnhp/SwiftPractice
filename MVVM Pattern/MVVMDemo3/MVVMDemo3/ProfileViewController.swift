//
//  ProfileViewController.swift
//  MVVMDemo3
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

enum ProfileSection: Int {
    
    case time
    case warmUp
    case coolDown
    
    static var count = ProfileSection.coolDown.hashValue + 1
    
    static let sectionTitles: [ProfileSection: String] = [
        time: "Time",
        warmUp: "Warm Up",
        coolDown: "Cool Down"
    ]
    
    var sectionTitle: String {
        return ProfileSection.sectionTitles[self] ?? ""
    }
}

class ProfileViewController: UIViewController {
    
    var profileViewModel: ProfileViewModel!
    
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = ProfileSection(rawValue: section) else {
            return 1
        }
        switch section {
        default: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = ProfileSection(rawValue: section) else {
            return ""
        }
        return section.sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let section = ProfileSection(rawValue: indexPath.section) {
            switch section {
            case .time:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as? ProfileTableViewCell {
                    return cell
                }
            default:
                break
            }
        }
        return UITableViewCell()
    }
}
