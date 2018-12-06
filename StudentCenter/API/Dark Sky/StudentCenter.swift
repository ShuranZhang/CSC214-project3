//
//  StudentCenter.swift
//  Weather
//
//  Created by Shuran Zhang on 12/2/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class StudentCenter {
    
    var timezone: String?
    var summary: String?
    var icon: String?
    var time: Int?
    
    init(timezone: String, data: [String : Any]) {
        
        self.timezone = timezone
        
        if let summary = data["summary"] as? String,
            let icon = data["icon"] as? String,
            let time = data["time"] as? Int {

            self.summary = summary
            self.icon = icon
            self.time = time
        }
    }
}
