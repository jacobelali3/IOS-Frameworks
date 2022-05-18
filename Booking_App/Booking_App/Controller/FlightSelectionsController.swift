//
//  FlightSelectionsController.swift
//  Booking_App
//
//  Created by Matthew Horner on 17/5/2022.
//

import Foundation
import UIKit

class FlightSelectionsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var flightDataArray = [Entry]()
    let flightURL = "http://api.aviationstack.com/v1/flights?access_key=c5970189867c88568b4dccb6ede6a42e&airline_iata=VA&flight_status=scheduled&limit=10"
    
    //var someUser : User = User()
    //etUserDate(_ day: Int,_ month: Int,_ year: Int,_ hour: Int,_ minute: Int){
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFlight()
        
        self.tableView.reloadData()
        //print(flightDataArray.count)
        
        
        
    }
    
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
                    //print(dataString!)
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
           
            //print(decodedData.entry[0].flight.number)
            //print(decodedData.entry[0].airline.name)
            //print(decodedData.entry[0].departure.scheduled)
            //print(decodedData.entry[0].departure.airport)
            //print(decodedData.entry[0].arrival.airport)
            
            var count = 0
            
            for flight in decodedData.entry {
                flightDataArray.append(flight)
                //print(flightDataArray[count].flight.number)
                count += 1
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
            print(error)
        }
    }
    
}

extension FlightSelectionsController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = flightDataArray[indexPath.row].departure.scheduled
        
        return cell
    }
    
    
}


