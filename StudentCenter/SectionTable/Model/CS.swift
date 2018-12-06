//

//   CS.swift
//   StudentCenter
//
//  Created by: Shuran Zhang on 12/2/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class CS: Equatable {
    
    static func == (lhs: CS, rhs: CS) -> Bool {
        return lhs.prof == rhs.prof && lhs.rate == rhs.rate
    }
    
    var prof: String
    var rate: String
    
    init(prof: String, rate: String) {
        self.prof = prof
        self.rate = rate
    }
}

