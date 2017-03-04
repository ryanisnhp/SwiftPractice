//
//  APIService.swift
//  MVVMDemo
//
//  Created by Su Nguyen T. on 2/22/17.
//  Copyright © 2017 AsianTech Co., Ltd. All rights reserved.
//

import Foundation

enum Method: String {
	case get = "GET"
	case post = "POST"
}

typealias RequestCompletion = (_ data: Data?,_ success: Bool,_ message: String?) -> Void

class APIService {
	
	static var sharedInstance: APIService {
		let instance = APIService()
		return instance
	}
	
	class func request(method: Method, url: String, params: [String: AnyObject]?, completionHanlder completed: RequestCompletion?) {
		var request = URLRequest(url: URL(string: url)!)
		request.httpMethod = method.rawValue
		let queue = DispatchQueue(label: "request")
		queue.async {
			URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
				DispatchQueue.main.async {
					completed?(data, true, nil)
				}
			}).resume()
		}
	}
}
