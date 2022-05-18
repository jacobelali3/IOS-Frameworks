//
//  Booking.swift
//  Booking_App
//
//  Created by Jacob Elali on 5/5/2022.
//

import Foundation
class Booking{
    //keep this as a string, we will concat a string with some integer when instantiating.
    var bookingNumber : String = "NOT_SET"
    var flightName : String = "Some flight"
    var date : Date = .now
    var price : Double = 0.0
    
    func getbookingNumber() -> String{
        return bookingNumber;
    }
    
    func setBookingNumber(bookingNumber: String){
        self.bookingNumber = bookingNumber;
    }
    
    func getFlightName() -> String{
        return flightName;
    }
    
    func setFlightName(flightName: String){
        self.flightName = flightName;
    }
    
    func getDate() -> Date{
        return date;
    }
    
    func getPrice() -> Double{
        return price;
    }
    
    func setPrice(price: Double){
        self.price = price;
    }
}
