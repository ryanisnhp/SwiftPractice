//
//  TaskList.swift
//  RealmDatabase
//
//  Created by Le Van Lam on 2/26/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import RealmSwift

class TaskList: Object {
    
    dynamic var name = ""
    dynamic var createdAt = Date()
    let task = List<Task>()
}
