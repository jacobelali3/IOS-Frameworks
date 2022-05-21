//
//  FlightOptionsController.swift
//  Booking_App
//
//  Created by Matthew Horner on 17/5/2022.
//

import Foundation
import UIKit

class FlightOptionsController: UIViewController {
    
    
    @IBOutlet weak var fromButton: UIButton!
    
    @IBOutlet weak var toButton: UIButton!
    
    @IBOutlet weak var selectedDate: UIDatePicker!
    
    @IBAction func dateChanged(_ sender: Any) {
        fDate = selectedDate.date
        print(fDate ?? "failed")
    }
    
    var someUser : User = User()
    
    var iataFrom: String = "SYD"
    var iataTo: String = "CBR"
    var fDate: Date?
    
    var booking: Booking?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fDate = selectedDate.date
        
        let optionFrom = {(action : UIAction) in
            print(action.title)
            
            switch action.title {
            case "Canberra":
                self.iataFrom = "CBR"
                
            case "Darwin":
                self.iataFrom = "DRW"
                
            case "Brisbane":
                self.iataFrom = "BNE"
                
            case "Adelaide":
                self.iataFrom = "ADL"
                
            case "Hobart":
                self.iataFrom = "HBA"
                
            case "Melbourne":
                self.iataFrom = "MEL"
                
            case "Perth":
                self.iataFrom = "PER"
                
            default:
                self.iataFrom = "SYD"
            }
            
            self.fromButton.setTitle(action.title, for: .normal)
            print(self.iataFrom)
        }
        
        fromButton.menu = UIMenu(children: [
            UIAction(title: "Sydney", handler: optionFrom),
            UIAction(title: "Canberra", handler: optionFrom),
            UIAction(title: "Darwin", handler: optionFrom),
            UIAction(title: "Brisbane", handler: optionFrom),
            UIAction(title: "Adelaide", handler: optionFrom),
            UIAction(title: "Hobart", handler: optionFrom),
            UIAction(title: "Melbourne", handler: optionFrom),
            UIAction(title: "Perth", handler: optionFrom)
        ])
        
        fromButton.showsMenuAsPrimaryAction = true
        
        let optionTo = {(action : UIAction) in
            print(action.title)
            
            switch action.title {
            case "Canberra":
                self.iataTo = "CBR"
                
            case "Darwin":
                self.iataTo = "DRW"
                
            case "Brisbane":
                self.iataTo = "BNE"
                
            case "Adelaide":
                self.iataTo = "ADL"
                
            case "Hobart":
                self.iataTo = "HBA"
                
            case "Melbourne":
                self.iataTo = "MEL"
                
            case "Perth":
                self.iataTo = "PER"
                
            default:
                self.iataTo = "SYD"
            }
            self.toButton.setTitle(action.title, for: .normal)
            print(self.iataTo)
        }
        
        toButton.menu = UIMenu(children: [
            UIAction(title: "Sydney", handler: optionTo),
            UIAction(title: "Canberra", handler: optionTo),
            UIAction(title: "Darwin", handler: optionTo),
            UIAction(title: "Brisbane", handler: optionTo),
            UIAction(title: "Adelaide", handler: optionTo),
            UIAction(title: "Hobart", handler: optionTo),
            UIAction(title: "Melbourne", handler: optionTo),
            UIAction(title: "Perth", handler: optionTo)
        ])
        
        
        toButton.showsMenuAsPrimaryAction = true
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSelect" {
            let VC = segue.destination as! FlightSelectionsController
            VC.arrIata = iataTo
            VC.depIata = iataFrom
            VC.flightDate = fDate
            VC.booking = booking
        }
    }
    
    
    
    
}
