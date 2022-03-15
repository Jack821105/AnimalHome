//
//  Ext_DateFormatter.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/1/6.
//

import Foundation

extension DateFormatter {
    
    static var yyyyMMdd: DateFormatter = {
       let new = DateFormatter()
        new.timeZone = .taiwanTimeZone
        new.isLenient = true
        new.dateFormat = "yyyyMMdd"
        return new
    }()
    
    /// "yyyy/MM/dd"
    static var yyyyMMddSeparate: DateFormatter = {
       let new = DateFormatter()
        new.timeZone = .taiwanTimeZone
        new.isLenient = true
        new.dateFormat = "yyyy/MM/dd"
        return new
    }()
    
    static var MMddSeparate: DateFormatter = {
       let new = DateFormatter()
        new.timeZone = .taiwanTimeZone
        new.isLenient = true
        new.dateFormat = "MM/dd"
        return new
    }()
    
    static var yyyyMMddDashWeek: DateFormatter = {
       let new = DateFormatter()
        new.timeZone = .taiwanTimeZone
        new.shortWeekdaySymbols = DateFormatter.weekDayString
        new.isLenient = true
        new.dateFormat = "yyyy-MM-dd (E)"
        return new
    }()
    
    static var yyyyMM: DateFormatter = {
       let new = DateFormatter()
        new.timeZone = .taiwanTimeZone
        new.isLenient = true
        new.dateFormat = "yyyyMM"
        return new
    }()
    
    static var yyyy: DateFormatter = {
       let new = DateFormatter()
        new.timeZone = .taiwanTimeZone
        new.isLenient = true
        new.dateFormat = "yyyy"
        return new
    }()
    
    static var accurateToSecond: DateFormatter = {
       let new = DateFormatter()
        new.dateFormat = "yyyy/MM/dd HH:mm:ss"
        new.timeZone = .taiwanTimeZone
        return new
    }()
    
    static var hhmm: DateFormatter = {
       let new = DateFormatter()
        new.dateFormat = "HH:mm"
        new.timeZone = .taiwanTimeZone
        return new
    }()
    
    static var weekDayString: [String] {
       return ["日", "一", "二", "三", "四", "五", "六"]
    }
    
    static var MMddDashWeek: DateFormatter = {
       let new = DateFormatter()
        new.timeZone = .taiwanTimeZone
        new.shortWeekdaySymbols = DateFormatter.weekDayString
        new.isLenient = true
        new.dateFormat = "MM/dd(E)"
        return new
    }()
    
}
