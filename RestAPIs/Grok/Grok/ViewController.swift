//
//  ViewController.swift
//  Grok
//
//  Created by Lam Le Van on 1/24/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

private let urlString = "https://jsonplaceholder.typicode.com/todos/1"

import UIKit

class ViewController: UIViewController {
    
    let myCompletionHandler: (Data?, URLResponse?, Error?) -> Void = { (data, response, error) in
        if let response = response {
            print(response)
        }
        if let error = error {
            print(error)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todoEndpoint: String = urlString
        guard let url = URL(string: todoEndpoint) else {
            print("Error: Can not create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: myCompletionHandler)
        task.resume()

    }
//    
//    open func dataTask(with request: URLRequest, completionHandle: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask {
//        completionHandle(data, response, error)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
