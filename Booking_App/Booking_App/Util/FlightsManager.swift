//
//  Flights.swift
//  Booking_App
//
//  Created by Matthew Horner on 17/5/2022.
//

import Foundation

struct FlightsManager {
    
    // Update the appid with your API Key
    let flightURL = "http://api.aviationstack.com/v1/flights?access_key=c5970189867c88568b4dccb6ede6a42e&airline_iata=VA&flight_status=scheduled&limit=10"
    
    func fetchFlight(cityName: String) {
        let urlString = "\(flightURL)"
        
        performRequest(urlString: urlString)
    }
    
    
    func performRequest(urlString: String) {
        // step1: create URL
        if let url = URL(string: urlString) {
            // step 2: create a URL session
            let session = URLSession(configuration: .default)
            // step 3: give URLSession a task
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
            
            // step 4: start a task
            task.resume()
        }
    }
    
    
    func parseJSON(flightsData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(FlightsData.self, from: flightsData)
            //print(decodedData.name)
            //print(decodedData.main.temp)
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
