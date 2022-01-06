//
//  Ext_Calendar.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import Foundation

extension Calendar {
    
    /// 取得台灣時區Calendar
    static func getTaiwanCalendar() -> Calendar {
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = TimeZone.taiwanTimeZone
        return calendar
    }
    
}
