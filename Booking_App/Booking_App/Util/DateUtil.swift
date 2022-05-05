//
//  DateUtil.swift
//  Booking_App
//
//  Created by Jacob Elali on 5/5/2022.
//

import Foundation
extension Date{
    func setUserDate(_ day: Int,_ month: Int,_ year: Int,_ hour: Int,_ minute: Int) -> Date{
    //I will add some data validation here later
        let day1: String = String(day)
        let month1: String = String(month)
        let year1: String = String(year)
        let hour1: String = String(hour)
        let minute1: String = String(minute)
    let formatter = DateFormatter()
    let providedDate: String = year1 + "/" + month1 + "/" + day1 + " " + hour1 + ":" + minute1
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter.date(from: providedDate)!

}
}
