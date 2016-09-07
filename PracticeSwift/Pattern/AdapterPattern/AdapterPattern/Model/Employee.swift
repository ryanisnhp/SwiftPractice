//
//  Employee.swift
//  AdapterPattern
//
//  Created by Le Van Lam on 7/27/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import Foundation

struct Employee {
    var name: String
    var title: String
}

protocol EmployeeDataSource {
    var employees: [Employee] {get}
    func searchByName(name: String) -> [Employee]
    func searchByTitle(title: String) -> [Employee]
}