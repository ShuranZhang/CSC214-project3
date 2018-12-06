//

//   Constants.swift
//   StudentCenter
//
//  Created by: Shuran Zhang on 12/2/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation

public struct Constants {
    
    // Rochester, NY
    public static let latitude = 43.2360
    public static let longitude = -77.6933
    
    public static let apiKey = "e7ae142ab5f8768dcc5c36de4c2fb3fa"
    public static let baseUrl = "https://api.darksky.net/Forecast/\(apiKey)/\(latitude),\(longitude)/"
}

