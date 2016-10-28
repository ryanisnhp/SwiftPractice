//
//  WKWebViewController.swift
//  WNWKWebView
//
//  Created by Lam Le Van on 6/26/16.
//  Copyright © 2016 Le Van Lam. All rights reserved.
//

import UIKit
import WebKit

struct UserKey {
    static let username = ""
    static let password = ""
}

private let kLoading = "loading"
private let kTitle = "title"
private let kEstimatedProgress = "estimatedProgress"
private let kCanGoBack = "canGoBack"
private let kCanGoForward = "canGoForward"
private var myContext = 0

class WKWebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    weak var webView: WKWebView!
    private var urlString = "https://www.google.com.vn/?gws_rd=ssl"
    private var webViewFrame: CGRect {
        return CGRect(x: 0, y: 81, width: screenWidth, height: screenHeight - 81.0)
    }
    private var screenWidth: CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }
    private var screenHeight: CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }
    
    deinit {
        self.webView.removeObserver(self, forKeyPath: kLoading)
        self.webView.removeObserver(self, forKeyPath: kTitle)
        self.webView.removeObserver(self, forKeyPath: kEstimatedProgress)
        self.webView.removeObserver(self, forKeyPath: kCanGoBack)
        self.webView.removeObserver(self, forKeyPath: kCanGoForward)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webViewConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: webViewFrame)
        webView.navigationDelegate = self
        webView.UIDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        view.addObserver(self, forKeyPath: kLoading, options: .New, context: &myContext)
        view.addObserver(self, forKeyPath: kTitle, options: .New, context: &myContext)
        view.addObserver(self, forKeyPath: kEstimatedProgress, options: .New, context: &myContext)
        view.addObserver(self, forKeyPath: kCanGoBack, options: .New, context: &myContext)
        view.addObserver(self, forKeyPath: kCanGoForward, options: .New, context: &myContext)
        self.webView = webView
        self.view.addSubview(self.webView)
        if let webView = self.webView {
            if let url = NSURL(string: urlString) {
                let urlRequest = NSURLRequest(URL: url, cachePolicy: .UseProtocolCachePolicy, timeoutInterval: 30)
                webView.loadRequest(urlRequest)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let webView = self.webView {
            webView.frame = webViewFrame
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if let keyPath = keyPath {
            switch keyPath {
            case kTitle:
                break
            case kLoading:
                break
            case kEstimatedProgress:
                break
            case kCanGoBack:
                break
            case kCanGoForward:
                break
            default:
                break
            }
        }
    }
    
    @IBAction func refreshBarButtonTapped(button: UIButton) {
        if let webView = self.webView {
            webView.reload()
        }
    }
    
    //MARK: - WKNavigationDelegate methods
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        switch navigationAction.navigationType {
        case .LinkActivated:
            if navigationAction.targetFrame == nil {
                self.webView.loadRequest(navigationAction.request)
            }
            decisionHandler(.Allow)
        default:
            if let url = navigationAction.request.URL {
                if url.scheme != "http" && url.scheme != "https" {
                    if UIApplication.sharedApplication().canOpenURL(url) {
                        UIApplication.sharedApplication().openURL(url)
                    }
                }
            }
            decisionHandler(.Cancel)
        }
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationResponse navigationResponse: WKNavigationResponse, decisionHandler: (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.Allow)
    }
    
    func webView(webView: WKWebView, didReceiveAuthenticationChallenge challenge: NSURLAuthenticationChallenge, completionHandler: (NSURLSessionAuthChallengeDisposition, NSURLCredential?) -> Void) {
        switch challenge.protectionSpace.authenticationMethod {
        case NSURLAuthenticationMethodServerTrust:
            let credential: NSURLCredential = NSURLCredential(user: UserKey.username, password: UserKey.password, persistence: NSURLCredentialPersistence.Permanent)
            completionHandler(.UseCredential, credential)
        case NSURLAuthenticationMethodHTTPBasic:
            let alertViewController = UIAlertController(title: "Authentication Required", message: webView.URL?.host, preferredStyle: .Alert)
            weak var usernameTextField: UITextField!
            alertViewController.addTextFieldWithConfigurationHandler({ (textField) -> Void in
                textField.placeholder = "Username"
                usernameTextField = textField
            })
            weak var passwordTextField: UITextField!
            alertViewController.addTextFieldWithConfigurationHandler({ (textField) -> Void in
                textField.placeholder = "Password"
                textField.secureTextEntry = true
                passwordTextField = textField
            })
            alertViewController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
                completionHandler(.CancelAuthenticationChallenge, nil)
            }))
            alertViewController.addAction(UIAlertAction(title: "Log in", style: .Default, handler: { (action) -> Void in
                guard let username = usernameTextField.text, let password = passwordTextField.text else {
                    completionHandler(.RejectProtectionSpace, nil)
                    return
                }
                let credential = NSURLCredential(user: username, password: password, persistence: NSURLCredentialPersistence.ForSession)
                completionHandler(.UseCredential, credential)
            }))
            self.presentViewController(alertViewController, animated: true, completion: nil)
        default:
            completionHandler(.RejectProtectionSpace, nil)
        }
    }
    
    // MARK: WKUIDelegate methods
    
    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: (() -> Void)) {
        let alertController = UIAlertController(title: frame.request.URL?.host, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            completionHandler()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func webView(webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: ((Bool) -> Void)) {
        let alertController = UIAlertController(title: frame.request.URL?.host, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { action in
            completionHandler(false)
        }))
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            completionHandler(true)
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func webView(webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: (String?) -> Void) {
        let alertController = UIAlertController(title: frame.request.URL?.host, message: prompt, preferredStyle: .Alert)
        weak var alertTextField: UITextField!
        alertController.addTextFieldWithConfigurationHandler { textField in
            textField.text = defaultText
            alertTextField = textField
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { action in
            completionHandler(nil)
        }))
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            completionHandler(alertTextField.text)
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Actions
    
    @IBAction private func backButtonClicked(sender: AnyObject) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction private func nextButtonClicked(sender: AnyObject) {
        if webView.canGoForward {
            webView.goForward()
        }
    }

}
