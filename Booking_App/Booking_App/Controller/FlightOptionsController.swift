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
        print(selectedDate.date)
    }
    
    var someUser : User = User()
    //etUserDate(_ day: Int,_ month: Int,_ year: Int,_ hour: Int,_ minute: Int){
    override func viewDidLoad() {
        super.viewDidLoad()
        var iataFrom: String?
        var iataTo: String?
        
        let optionFrom = {(action : UIAction) in
            print(action.title)
            
            switch action.title {
            case "Canberra":
                iataFrom = "CBR"
                
            case "Darwin":
                iataFrom = "DRW"
                
            case "Brisbane":
                iataFrom = "BNE"
                
            case "Adelaide":
                iataFrom = "ADL"
                
            case "Hobart":
                iataFrom = "HBA"
                
            case "Melbourne":
                iataFrom = "MEL"
                
            case "Perth":
                iataFrom = "PER"
                
            default:
                iataFrom = "SYD"
            }
            
            print(iataFrom ?? "")
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
                iataTo = "CBR"
                
            case "Darwin":
                iataTo = "DRW"
                
            case "Brisbane":
                iataTo = "BNE"
                
            case "Adelaide":
                iataTo = "ADL"
                
            case "Hobart":
                iataTo = "HBA"
                
            case "Melbourne":
                iataTo = "MEL"
                
            case "Perth":
                iataTo = "PER"
                
            default:
                iataTo = "SYD"
            }
            
            print(iataTo ?? "")
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
    
   
    
    

    
    
}
