//
//  Flight.swift
//  Booking_App
//
//  Created by Matthew Horner on 21/5/2022.
//

import Foundation
class Flight{
    var name : String = "Sydney to Darwin"
    var id : String = "123"
    var destination : String = "Darwin"
    var departure : String = "Sydney"
    var datetime : Date = .now
    
    func getName() -> String{
        return name;
    }
    
    func setName(name: String){
        self.name = name;
    }
    
    
    func getId() -> String{
        return id;
    }
    
    func setId(id: String){
        self.id = id;
    }
    
    
    func getDeparture() -> String{
        return departure;
    }
    
    func setDeparture(depature: String){
        self.departure = depature;
    }
    
    
    func getDestination() -> String{
        return destination;
    }
    
    func setDestination(destination: String){
        self.destination = destination;
    }
    
    func getDatetime() -> Date{
        return datetime
    }
    
    func setDatetime(datetime: Date){
        self.datetime = datetime
    }
}
