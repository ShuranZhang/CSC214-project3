//

//   Math.swift
//   StudentCenter
//
//  Created by: Shuran Zhang on 12/2/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class Math: Equatable {
    
    static func == (lhs: Math, rhs: Math) -> Bool {
        return lhs.prof == rhs.prof && lhs.rate == rhs.rate
    }
    
    var prof: String
    var rate: String
    
    init(prof: String, rate: String) {
        self.prof = prof
        self.rate = rate
    }
}


