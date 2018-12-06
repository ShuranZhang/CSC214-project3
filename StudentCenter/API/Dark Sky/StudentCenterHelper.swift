//
//  DarkSky.swift
//  Weather
//
//  Created by Shuran Zhang on 8/12/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation

enum StudentCenterHelperResult {
    case Success([StudentCenter])
    case Failure(Error)
}

class StudentCenterHelper {
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchStudentCenter(completion: @escaping (StudentCenterHelperResult) -> Void) {
        
        var language = "en"
        if let deviceLanguage = Locale.current.languageCode {
            if deviceLanguage == "zh"{
                language = deviceLanguage
            }
        }
        
        let params = [
            "exclude": "currently,minutely,hourly,alerts,flags",
            "units": "auto",
            "lang": language]
        
        let url = DarkSkyAPI.darkSkyURL(parameters: params)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            guard let jsonData = data else {
                completion(.Failure(error!))
                return
            }
            
            OperationQueue.main.addOperation {
                completion(DarkSkyAPI.studentcenter(fromJSON: jsonData)!)
            }
        })
        task.resume()
    }
}

