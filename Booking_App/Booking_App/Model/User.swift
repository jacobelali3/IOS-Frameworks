//
//  User.swift
//  Booking_App
//
//  Created by Jacob Elali on 5/5/2022.
//

import Foundation
class User{
    var name : String = "someUser"
   // var balance : Double = 0.0 - Not needed, we're not keeping track of balance as payment is immediate.
    var email : String = "defaultEmail"
//    var ticket : Ticket = Ticket()
//    var booking : Booking = Booking()
    
    func getName() -> String{
        return name;
    }
    
    func setName(name: String){
        self.name = name;
    }
    
    func getEmail() -> String{
        return email;
    }
    
    func setEmail(email: String){
        self.email = email;
    }
    
}
