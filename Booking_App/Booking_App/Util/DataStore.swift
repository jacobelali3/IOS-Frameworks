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

let USERFIRSTNAMEKEY = "USER_FIRSTNAME_KEY"
let USERSURNAMEKEY = "USER_SURNAME_KEY"
let EMAILKEY = "USER_EMAIL_KEY"
let TICKETKEY = "USER_TICKET_KEY"
let BOOKINGNUMBERKEY = "USER_BOOKING_NUMBER_KEY"
let FLIGHTNAMEKEY = "USER_BOOKING_FLIGHT_NAME"
let DATEKEY = "USER_BOOKING_DATE"
let PRICEKEY = "USER_BOOKING_DATE"
let TICKETNUMBERKEY = "USER_TICKET_NUMBER"
let TICKETFLIGHTNUMBER = "USER_TICKET_FLIGHTNUMBER"
let TICKETSEAT = "USER_TICKET_SEAT"

let booking: Booking = Booking();

/*
 Serves as a persistent database to store users and settings.
 */
class DataStore{
    
    
    static let access = DataStore()
    
    /*
     User variables - add/remove here if you wish
     */
    var userFirstName : String = booking.user.firstName
    {
        didSet {
            UserDefaults.standard.set(userFirstName, forKey: USERFIRSTNAMEKEY)
        }
    }
    var userSurname : String =
    booking.user.surname
    {
        didSet {
            UserDefaults.standard.set(userSurname,
                                      forKey: USERSURNAMEKEY)
        }
    }
    var userEmail : String = booking.user.email
    {
        didSet {
            UserDefaults.standard.set(userEmail, forKey: EMAILKEY)
        }
    }
    /*
     Booking variables - add/remove here if you wish
     */
    var userBookingNumber : String = booking.bookingNumber
    {
        didSet {
            UserDefaults.standard.set(userBookingNumber, forKey: BOOKINGNUMBERKEY)
        }
    }
    var userBookingFlightName : String = booking.flightName
    {
        didSet {
            UserDefaults.standard.set(userBookingFlightName, forKey: FLIGHTNAMEKEY)
        }
    }
    var userBookingDate : Date = booking.date
    {
        didSet {
            UserDefaults.standard.set(userBookingFlightName, forKey: DATEKEY)
        }
    }
    var userBookingPrice : Double = booking.price
    {
        didSet {
            UserDefaults.standard.set(userBookingFlightName, forKey: PRICEKEY)
        }
    }
    /*
     Ticket variables - add/remove here if you wish
     */
    var userTicketNumber : String = booking.ticket.ticketNumber
    {
        didSet {
            UserDefaults.standard.set(userTicketNumber, forKey: PRICEKEY)
        }
    }
    var userTicketFlightNumber: String = booking.ticket.flightNumber
    {
        didSet {
            UserDefaults.standard.set(userTicketFlightNumber, forKey: PRICEKEY)
        }
    }
    var userTicketSeat: Int = booking.ticket.seat
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
