//
//  ArithmeticUtil.swift
//  Booking_App
//
//  Created by Jacob Elali on 5/5/2022.
//

import Foundation

//Assists convert slider into 2 decimal values.
extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}
