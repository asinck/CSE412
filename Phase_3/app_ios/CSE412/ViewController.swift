//
//  ViewController.swift
//  CSE412
//
//  Created by asinck on 4/18/17.
//  Copyright © 2017 asinck. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webview.delegate = self;
        
        let url = NSURL(string: "http://cse412.michaeljscott.net");
        let request = NSURLRequest(url: url as! URL);
        webview.loadRequest(request as URLRequest);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

