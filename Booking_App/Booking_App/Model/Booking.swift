//
//  Booking.swift
//  Booking_App
//
//  Created by Jacob Elali on 5/5/2022.
//

import Foundation
struct Booking{
    
    var bookingId : String = "NOT_SET"
    var paymentDetails : Payment = Payment()
    var ticketDetails : Ticket = Ticket()
    var userDetails : User = User()
}
