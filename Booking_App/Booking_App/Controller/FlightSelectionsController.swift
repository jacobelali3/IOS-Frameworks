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
    var booking: Booking = Booking()
    
    
    var flightDataArray = [Entry]()
    let flightURL = "http://api.aviationstack.com/v1/flights?access_key=38218bad06e67ac4cfaa200855291827&flight_status=scheduled&limit=10"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetBackgroundLoading("Loading")
        
        print(flightDate ?? "missing")
        print(depIata ?? "missing")
        print(arrIata ?? "missing")
        
        fetchFlight(toIata: arrIata ?? "", fromIata: depIata ?? "")
        
        //self.tableView.reloadData()
        
        
        
        
        
        
        
    }
    
    
    func tableSetBackgroundLoading(_ message: String) {
        let backgroundLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        backgroundLabel.text = message
        backgroundLabel.textAlignment = .center
        tableView.backgroundView = backgroundLabel
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
            
            if (flightDataArray.isEmpty) {
                DispatchQueue.main.async {
                    self.tableSetBackgroundLoading("No flights found")
                }
            
            } else {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.tableView.backgroundView = nil
                    
                }
                
            }
            
            
        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToUser" {
                let VC = segue.destination as! UserDetailController
                VC.booking = booking
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
        
        let timeGross = flightDataArray[indexPath.row].departure.scheduled.components(separatedBy: "T")
        
        let time = timeGross[1].components(separatedBy: "+")
        
        let dateFormater = DateFormatter()
        
        dateFormater.dateFormat = "YY/MM/dd"
        
        let date = dateFormater.string(from: flightDate!)
        
        print(date)
        
        dateFormater.dateFormat = "YY/MM/DD HH:mm:ss"
        
        let finalDate = date + " " + time[0]
        
        let newDate = dateFormater.date(from: finalDate)
        
        print(finalDate)
        
        booking.ticketDetails.arrLocation = flightDataArray[indexPath.row].arrival.airport;
        
        booking.ticketDetails.depLocation = flightDataArray[indexPath.row].departure.airport;
        
        booking.ticketDetails.departureTime = finalDate;
        
        booking.ticketDetails.flightNumber = flightDataArray[indexPath.row].flightN.number
        
        print(booking.ticketDetails.departureTime)
        
        
        self.performSegue(withIdentifier: "goToUser", sender: nil)
        
        
    }
    
    
}


