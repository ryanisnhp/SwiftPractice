//
//  Helpers.swift
//  HonoluluArtDemo
//
//  Created by LeVanLam on 2/18/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import Foundation

enum API {
//    static let host = "https://data.honolulu.gov/resource/csir-pcj2.json"
    static let `protocol` = "https://"
    static let subDomain = ""
    static let hostDomain = "data.honolulu.gov"
    static let directory = "resource"
    static let queryParameters = "csir-pcj2.json"
    static let url = API.`protocol` + API.hostDomain + "/" + API.directory + "/" + API.queryParameters
}
