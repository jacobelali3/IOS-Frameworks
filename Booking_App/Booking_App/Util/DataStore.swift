//
//  DataStore.swift
//  Booking_App
//
//  Created by Jacob Elali on 5/5/2022.
//
import Foundation
/*
 var bookingNumber : String = "NOT_SET"
 var flightName : String = "Some flight"
 var date : Date = .now
 var paid : Double = 0.0
}
 */

let USERNAMEKEY = "USER_NAME_KEY"
let EMAILKEY = "USER_EMAIL_KEY"
let TICKETKEY = "USER_TICKET_KEY"
let BOOKINGNUMBERKEY = "USER_BOOKING_NUMBER_KEY"
let FLIGHTNAMEKEY = "USER_BOOKING_FLIGHT_NAME"
let DATEKEY = "USER_BOOKING_DATE"
let PRICEKEY = "USER_BOOKING_DATE"
let TICKETNUMBERKEY = "USER_TICKET_NUMBER"
let TICKETFLIGHTNUMBER = "USER_TICKET_FLIGHTNUMBER"
let TICKETSEAT = "USER_TICKET_SEAT"

let user : User = User()

/*
 Serves as a persistent database to store users and settings.
 */
class DataStore{
    
    
    static let access = DataStore()
    
    /*
     User variables - add/remove here if you wish
     */
    var userName : String = user.name
    {
        didSet {
            UserDefaults.standard.set(userName, forKey: USERNAMEKEY)
        }
    }
    var userEmail : String = user.email
    {
        didSet {
            UserDefaults.standard.set(userEmail, forKey: EMAILKEY)
        }
    }
    /*
     Booking variables - add/remove here if you wish
     */
    var userBookingNumber : String = user.booking.bookingNumber
    {
        didSet {
            UserDefaults.standard.set(userBookingNumber, forKey: BOOKINGNUMBERKEY)
        }
    }
    var userBookingFlightName : String = user.booking.flightName
    {
        didSet {
            UserDefaults.standard.set(userBookingFlightName, forKey: FLIGHTNAMEKEY)
        }
    }
    var userBookingDate : Date = user.booking.date
    {
        didSet {
            UserDefaults.standard.set(userBookingFlightName, forKey: DATEKEY)
        }
    }
    var userBookingPrice : Double = user.booking.price
    {
        didSet {
            UserDefaults.standard.set(userBookingFlightName, forKey: PRICEKEY)
        }
    }
    /*
     Ticket variables - add/remove here if you wish
     */
    var userTicketNumber : String = user.ticket.ticketNumber
    {
        didSet {
            UserDefaults.standard.set(userTicketNumber, forKey: PRICEKEY)
        }
    }
    var userTicketFlightNumber: String = user.ticket.flightNumber
    {
        didSet {
            UserDefaults.standard.set(userTicketFlightNumber, forKey: PRICEKEY)
        }
    }
    var userTicketSeat: Int = user.ticket.seat
    {
        didSet {
            UserDefaults.standard.set(userTicketSeat, forKey: PRICEKEY)
        }
    }
    
    /*
     Settings variables
     */
  
    
    //Put all variables that have to do with APP interaction here, eg for bubble pop we had timer, bubbleNumber etc
 
    
    private init(){
        
    }
    
}
