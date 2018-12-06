//

//   BBViewController.swift
//   StudentCenter
//
//  Created by: Shuran Zhang on 12/5/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation
import WebKit
class BBViewController:UIViewController{
    @IBOutlet weak var webView:WKWebView!
    let mapURL = "https://learn.rochester.edu"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=NSLocalizedString("str_bb", comment: "")
        loadRequest()
    }
    
    func loadRequest() {
        
        if let url = URL(string: mapURL) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
}
