//
//  String+Date.swift
//  Anista
//
//  Created by nguyen.ngoc.ban on 21/05/2022.
//

import Foundation

enum DateFormat: String {
    case ymd = "yyyy-MM-dd"
    case dmy = "dd-MM-YYYY"
    case dmyHM = "dd/MM/YYYY HH:mm"
    case dmyHMS = "dd/MM/YYYY HH:mm:ss"
    case dmSlash = "dd/MM"
    case ym = "yyyy-MM"
    case ms = "mm:ss"
    case hms = "HH:mm:ss"
    case hm = "HH:mm"
    case h = "HH"
    case ymdSlash = "yyyy/MM/dd"
    case dmySlash = "dd/MM/yyyy"
    case mdy = "MM/dd/yyyy"
    case serverYMDHMS = "yyyy-MM-dd HH:mm:ss"
    case timeDetail = "HH:mm EEE dd/MM/yyyy"
    case timeDetail2 = "EEE dd/MM/yyyy"
    case timeDetail3 = "EEE"
    case timeDetail4 = "EEEE"
    case timeDetail5 = "dd"
    case timeDetail6 = "EEEE, dd/MM/yyyy"
    case timeDetail7 = "EEEE, HH:mm - dd/MM/yyyy"
    case timeDetail8 = "MMMM"
    case timeDetail9 = "dd/MM - HH:mm"
    case timeDetail10 = "EEEE, dd/MM"
    case timeDetail11 = "HH:mm - dd/MM"
    case timeDetail12 = "MMMM yyyy"
    case timeDetail13 = "EEEE - dd/MM"
    case timeDetail14 = "EEE, dd/MM"
}

extension String {

    func toDate(from dateFormat: DateFormat) -> Date? {
        let formatter = DateFormatter.getVNDateformatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.date(from: self)
    }

    func toOtherDateFormat(from format1: DateFormat, to format2: DateFormat) -> String? {
        let formatter = DateFormatter.getVNDateformatter()
        formatter.dateFormat = format1.rawValue

        guard let date = formatter.date(from: self) else {
            return nil
        }
        formatter.dateFormat = format2.rawValue
        return formatter.string(from: date)
    }

}

extension Date {

    func changeDateFormat(dateFormat: DateFormat = .ymd) -> Date {
        let formatter = DateFormatter.getVNDateformatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.date(from: self.toString(dateFormat)) ?? Date()
    }

    func toString(_ dateFormat: DateFormat = .ymd) -> String {
        let formatter = DateFormatter.getVNDateformatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.string(from: self)
    }
}

extension DateFormatter {
    static func getVNDateformatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "vi")
        formatter.calendar = .current
        return formatter
    }
}

extension String {
    func toDateString(format: DateFormat = .dmyHMS) -> String  {
        guard let time = self.components(separatedBy: ".").first?
            .replacingOccurrences(of: "T", with: " ") else {
            return ""
        }
        return time.toOtherDateFormat(from: .serverYMDHMS, to: format) ?? self
    }
}
