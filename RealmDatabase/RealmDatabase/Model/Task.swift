//
//  Task.swift
//  RealmDatabase
//
//  Created by Le Van Lam on 2/26/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import RealmSwift

class Task: Object {
    dynamic var name = ""
    dynamic var createdAt = Date()
    dynamic var notes = ""
    dynamic var isCompleted = false
}
