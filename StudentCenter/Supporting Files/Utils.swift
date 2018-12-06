//
//  Utils.swift
//  StudentCenter
//
//  Created by Shuran Zhang on 12/2/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation

public func dayFromSeconds(seconds: Int, timeZoneString: String?) -> String {
    
    let date = Date(timeIntervalSince1970: Double(seconds))
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    
    if let timeZoneString = timeZoneString {
        if TimeZone.knownTimeZoneIdentifiers.contains(timeZoneString) {
            formatter.timeZone = TimeZone(identifier: timeZoneString)
        } else {
            formatter.timeZone = TimeZone.autoupdatingCurrent
        }
    } else {
        formatter.timeZone = TimeZone.autoupdatingCurrent
    }
    
    var localTimeString = formatter.string(from: date)
    
    let todayTimeString = formatter.string(from: Date())
    if localTimeString == todayTimeString {
        return NSLocalizedString("str_today", comment: "")
    }
    
    let tomorrow = (Calendar.current as NSCalendar).date(byAdding: .day, value: 1, to: Date(), options:[])!
    let tomorrowTimeString = formatter.string(from: tomorrow)
    if localTimeString == tomorrowTimeString {
        return NSLocalizedString("str_tomorrow", comment: "")
    }
    
    formatter.dateFormat = "cccc"
    localTimeString = formatter.string(from: date)
    return localTimeString
}
