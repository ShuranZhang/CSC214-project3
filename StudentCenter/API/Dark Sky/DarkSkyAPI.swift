//
//  DarkSkyAPI.swift
//  Weather
//
//  Created by Shuran Zhang on 12/2/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation


struct DarkSkyAPI {
        
    static func darkSkyURL(parameters: [String:String]) -> URL {
        
        var components = URLComponents(string: Constants.baseUrl)!
        var queryItems = [URLQueryItem]()

        for (key, value) in parameters {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        components.queryItems = queryItems
        return components.url!
    }
    
    static func studentcenter(fromJSON data: Data) -> StudentCenterHelperResult? {
        
        do {
            let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
            
            var studentcenters = [StudentCenter]()
            if let timezone = jsonDictionary["timezone"] as? String,
                let daily = jsonDictionary["daily"] as? [String : Any],
                let data = daily["data"] as? [[String: Any]] {
                    for datapoint in data {
                        let studentcenter = StudentCenter(timezone: timezone, data: datapoint)
                        print(studentcenter)
                        studentcenters.append(studentcenter)
                    }
            }
            return .Success(studentcenters)
            
        } catch let error {
            return .Failure(error)
        }
    }
    
}
