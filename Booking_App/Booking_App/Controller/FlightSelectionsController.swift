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
    
    var depIata: String?
    var arrIata: String?
    var flightDate: Date?
    
    var flightDataArray = [Entry]()
    let flightURL = "http://api.aviationstack.com/v1/flights?access_key=c5970189867c88568b4dccb6ede6a42e&flight_status=scheduled&limit=10"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(depIata ?? "missing")
        print(arrIata ?? "missing")
        
        fetchFlight(toIata: arrIata ?? "CBR", fromIata: depIata ?? "ADL")
        
        self.tableView.reloadData()
        
        
        
    }
    
    func fetchFlight(toIata: String, fromIata: String) {
        let urlString = "\(flightURL)" + "&dep_iata=" + fromIata + "&arr_iata=" + toIata
        
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
           
            for flight in decodedData.entry {
                flightDataArray.append(flight)
                
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
        
        let timeGross = flightDataArray[indexPath.row].departure.scheduled.components(separatedBy: "T")
        
        let time = timeGross[1].components(separatedBy: "+")
        
        cell.textLabel?.text = time[0]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(flightDataArray[indexPath.row].departure.scheduled)
    }
    
    
}


