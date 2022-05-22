//
//  Booking.swift
//  Booking_App
//
//  Created by Jacob Elali on 5/5/2022.
//

import Foundation
struct Booking{
    //keep this as a string, we will concat a string with some integer when instantiating.
    var bookingNumber : String = "NOT_SET"
    var flightName : String = "Some flight"
    var date : Date = .now
    var price : Double = 0.0
    let user : User = User();
    let ticket : Ticket = Ticket();
    // var flight : Flight?; - In case we need to store flights data.
}
