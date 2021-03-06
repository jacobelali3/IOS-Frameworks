//
//  FlightsData.swift
//  Booking_App
//
//  Created by Matthew Horner on 17/5/2022.
//

import Foundation

struct FlightsData: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case entry = "data"
    }
    
    let entry : [Entry]
    //let flightStatus: String
}

struct Entry: Decodable {
    enum CodingKeys: String, CodingKey {
        case flightDate = "flight_date"
        case flightStatus = "flight_status"
        case flightN = "flight"
        case departure
        case arrival
        case airline
    }
    
    let flightDate: String
    let flightStatus: String
    
    let flightN : FlightN
    let departure : Departure
    let arrival : Arrival
    let airline : Airline
}

struct FlightN : Decodable {
    let number : String
}

struct Airline : Decodable {
    let name : String
}

struct Departure : Decodable {
    let airport : String
    let scheduled : String
}

struct Arrival : Decodable {
    let airport : String
    let scheduled : String
}

