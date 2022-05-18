//
//  Ticket.swift
//  Booking_App
//
//  Created by Jacob Elali on 5/5/2022.
//

import Foundation
class Ticket{
    //Combination of flight name + some random number
    var ticketNumber : String = "123"
    var flightNumber : String = "someFlightName"
    var seat : Int = -1
    
    func getTicketNumber() -> String{
        return ticketNumber;
    }
    
    func setTicketNumber(ticketNumber: String){
        self.ticketNumber = ticketNumber;
    }
    
    func getFlightNumber() -> String{
        return flightNumber;
    }
    
    func setFlightNumber(flightNumber: String){
        self.flightNumber = flightNumber;
    }
    
}
