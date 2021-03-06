//
//  CodeOfConductViewController.swift
//  hackGSU
//
//  Created by saiharsha goli on 10/18/16.
//  Copyright © 2016 Panther Hackers. All rights reserved.
//

import UIKit

class SendFeedbackController: UIViewController, UIWebViewDelegate {
    
    lazy var codeOfConductWebView: UIWebView = {
        let webV: UIWebView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 109))
        webV.loadRequest(URLRequest(url: URL(string: "https://sri40.typeform.com/to/QTFwTX")!))
        webV.delegate = self
        return webV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(codeOfConductWebView)
        setupNavBarAttributes()
        //setupViews()
        
    }
    
    func setupViews(){
        view.addSubview(codeOfConductWebView)
        codeOfConductWebView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        codeOfConductWebView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        codeOfConductWebView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        codeOfConductWebView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -49).isActive = true
        
    }
    
    func setupNavBarAttributes() {
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Send Feedback"
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Avenir", size: 18)!, NSForegroundColorAttributeName : UIColor.white]
        navigationController!.navigationBar.tintColor = .white
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true;
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {        
    }
    
}
