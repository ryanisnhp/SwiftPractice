//
//  ViewController.swift
//  AlamofireWithXML
//
//  Created by Le Van Lam on 2/24/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    fileprivate var vnexpresses: [Vnexpress] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        setUpUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUpData() {
        VnexpressNetwork.sharedInstance.completion = { [weak self] vnexpresses in
            guard let this = self else { return }
            this.vnexpresses = vnexpresses.objects
            DispatchQueue.main.async {
                this.tableView.reloadData()
            }
        }
        VnexpressNetwork.sharedInstance.parseXM()
    }
    
    private func setUpUI() {
        tableView.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellReuseIdentifier: "HomeViewCell")
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HomeViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard vnexpresses.count > 0 else { return }
        guard let link = vnexpresses[indexPath.row].link else { return }
        let webViewController = WebViewController(urlString: link)
        navigationController?.pushViewController(webViewController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vnexpresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell") as? HomeViewCell, vnexpresses.count > 0 {
            cell.configCell(vnexpress: vnexpresses[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

class WebViewController: UIViewController {
    
    private var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
        view.addSubview(webView)
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        
        let leftButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.done, target: self, action: #selector(back))
        navigationController?.navigationItem.backBarButtonItem = leftButton
    }
    
    @objc private func back(button: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
}
