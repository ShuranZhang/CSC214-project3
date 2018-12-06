//

//   WebViewController.swift
//   StudentCenter
//
//  Created by: Shuran Zhang on 12/4/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation
import UIKit
import WebKit
class WebViewController:UIViewController{
    
    @IBOutlet weak var webView: WKWebView!
    let mapURL = "https://www.google.com/maps/place/University+of+Rochester/@43.130557,-77.628192,17z/data=!3m1!4b1!4m5!3m4!1s0x89d6b4c60f59a507:0x6847ecd04cdde1d7!8m2!3d43.1305531!4d-77.6260033"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=NSLocalizedString("str_map", comment: "")
        loadRequest()
    }
    
    func loadRequest() {
        
        if let url = URL(string: mapURL) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    // MARK: - Actions
    
 
}
