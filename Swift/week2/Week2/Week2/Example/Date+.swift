//
//  Date+.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

extension Date {
    public func setTime(year: Int, month: Int, day: Int, hour: Int, min: Int, sec: Int, timeZoneAbbrev: String = "UTC") -> Date {
        let x: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        let cal = Calendar.current
        var components = cal.dateComponents(x, from: self)

        components.timeZone = TimeZone(abbreviation: timeZoneAbbrev)
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = min
        components.second = sec

        return cal.date(from: components) ?? Date()
    }
}
