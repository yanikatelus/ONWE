//
//  DateFormatter.swift
//  ONWE
//
//  Created by Yanika Telus on 5/23/22.
//

import Foundation

func formatDate(_ timeStamp: Double) -> String {
    let epocTime = TimeInterval(timeStamp)
    let myDate = NSDate(timeIntervalSince1970: epocTime) as Date
    
    let components = Calendar.current.dateComponents([.hour, .minute,.weekday, .day, .month, .year], from: myDate)
    let weekdayNum = components.weekday ?? 0
    var weekday = ""
    switch weekdayNum{
        case 1:
            weekday = "SUN"
        case 2:
            weekday = "MON"
        case 3:
            weekday = "TUE"
        case 4:
            weekday = "WED"
        case 5:
            weekday = "THU"
        case 6:
            weekday = "FRI"
        default :
            weekday = "SAT"
    }
    
    let day = components.day ?? 0
    let month = components.month ?? 0
    let year = components.year ?? 0
    
    return "\(weekday) \(month) \(day)"
    //"Sun 12 20"
}
