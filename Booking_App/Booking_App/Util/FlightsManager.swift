//
//  Flights.swift
//  Booking_App
//
//  Created by Matthew Horner on 17/5/2022.
//

import Foundation

struct FlightsManager {
    
    let flightURL = "http://api.aviationstack.com/v1/flights?access_key=c5970189867c88568b4dccb6ede6a42e&airline_iata=VA&flight_status=scheduled&limit=10"
    
    func fetchFlight() {
        let urlString = "\(flightURL)"
        
        performRequest(urlString: urlString)
    }
    
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
           
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                    self.parseJSON(flightsData: safeData)
                }
            }
            
            task.resume()
        }
    }
    
    
    func parseJSON(flightsData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(FlightsData.self, from: flightsData)
           
            print(decodedData.entry[0].flight.number)
            print(decodedData.entry[0].airline.name)
            print(decodedData.entry[0].departure.scheduled)
            print(decodedData.entry[0].departure.airport)
            print(decodedData.entry[0].arrival.airport)
            
        } catch {
            print(error)
        }
    }
    
    
    
}
