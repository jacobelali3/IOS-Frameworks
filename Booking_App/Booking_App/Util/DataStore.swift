//
//  DataStore.swift
//  Booking_App
//
//  Created by Jacob Elali on 5/5/2022.
//
import Foundation


let FIRSTNAMEKEY = "FIRST_NAME_KEY"
let LASTNAMEKEY = "LAST_NAME_KEY"
let EMAILKEY = "EMAIL_KEY"
let CARDNUMBERKEY = "CARD_NUMBER_KEY"
let CVVKEY = "CVV_KEY"
let EXPIRYKEY = "EXPIRY_KEY"
let POSTCODEKEY = "POST_CODE_KEY"
let CARDHOLDERNAMEKEY = "CARD_HOLDER_NAME_KEY"

let FLIGHTNUMBERKEY = "FLIGHT_NUMBER_KEY"
let ARRLOCATIONKEY = "ARR_LOCATION_KEY"
let DEPLOCATIONKEY = "DEP_LOCATION_KEY"
let DEPARTURETIMEKEY = "DEPARTURE_TIME_KEY"



let booking : Booking = Booking()

/*
 Serves as a persistent database to store users and settings.
 */
class DataStore{
    
    
    static let access = DataStore()
    
    /*
     User variables - add/remove here if you wish
     */
    var firstName : String = booking.userDetails.firstName
    {
        didSet {
            UserDefaults.standard.set(firstName, forKey: FIRSTNAMEKEY)
        }
    }
    var lastName : String = booking.userDetails.lastName
    {
        didSet {
            UserDefaults.standard.set(lastName, forKey: LASTNAMEKEY)
        }
    }
    var email : String = booking.userDetails.lastName
    {
        didSet {
            UserDefaults.standard.set(email, forKey: EMAILKEY)
        }
    }
    /*
     Payment variables - add/remove here if you wish
     */
    var cardNumber : String = booking.paymentDetails.cardNumber
    {
        didSet {
            UserDefaults.standard.set(cardNumber, forKey: CARDNUMBERKEY)
        }
    }
    var cvv : String = booking.paymentDetails.cvv
    {
        didSet {
            UserDefaults.standard.set(cardNumber, forKey: CVVKEY)
        }
    }
    var expiry : String = booking.paymentDetails.expiry
    {
        didSet {
            UserDefaults.standard.set(expiry, forKey: EXPIRYKEY)
        }
    }
    var postCode : String = booking.paymentDetails.postCode
    {
        didSet {
            UserDefaults.standard.set(postCode, forKey: POSTCODEKEY)
        }
    }
    var cardHolderName : String = booking.paymentDetails.cardHolderName
    {
        didSet {
            UserDefaults.standard.set(cardHolderName, forKey: CARDHOLDERNAMEKEY)
        }
    }
    /*
     Ticket variables - add/remove here if you wish
     */
    var flightNumber : String = booking.ticketDetails.flightNumber
    {
        didSet {
            UserDefaults.standard.set(flightNumber, forKey: FLIGHTNUMBERKEY)
        }
    }
    var arrLocation : String = booking.ticketDetails.arrLocation
    {
        didSet {
            UserDefaults.standard.set(arrLocation, forKey: ARRLOCATIONKEY)
        }
    }
    var depLocation : String = booking.ticketDetails.depLocation
    {
        didSet {
            UserDefaults.standard.set(depLocation, forKey: DEPLOCATIONKEY)
        }
    }
    var departureTime : String = booking.ticketDetails.departureTime
    {
        didSet {
            UserDefaults.standard.set(departureTime, forKey: DEPARTURETIMEKEY)
        }
    }
    
    
    /*
     Settings variables
     */
    //Put all variables that have to do with APP interaction here, eg for bubble pop we had timer, bubbleNumber etc
 
    
    private init(){
        
    }
    
}
