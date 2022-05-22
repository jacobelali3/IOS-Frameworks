//
//  EditBookingController.swift
//  Booking_App
//
//  Created by Kevin Yu on 18/5/2022.
//

import Foundation
import UIKit

class EditBookingController: UIViewController {
    
    let alert = EmailAlert()
    
    @IBOutlet weak var bookingIdTextField: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBAction func save(){
        DataStore.access.bookingId = bookingIdTextField.text!
        DataStore.access.firstName = firstNameTextField.text!
        DataStore.access.lastName = lastNameTextField.text!
        DataStore.access.email = emailTextField.text!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeHideKeyboard()
        if (DataStore.access.bookingId.isEmpty || DataStore.access.bookingId.count <= 0)
        {
            
            alert.showAlert(with: "Attention!", message: "You must make a booking first before editing!", on: self)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.navigationController?.popViewController(animated: true)
            }
        
        }
        bookingIdTextField.text = DataStore.access.bookingId
        firstNameTextField.placeholder = DataStore.access.firstName
        lastNameTextField.placeholder = DataStore.access.lastName
        emailTextField.placeholder = DataStore.access.email
        	
    }
    func initializeHideKeyboard(){
     //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
     let tap: UITapGestureRecognizer = UITapGestureRecognizer(
     target: self,
     action: #selector(dismissMyKeyboard))
     //Add this tap gesture recognizer to the parent view
     view.addGestureRecognizer(tap)
     }
     @objc func dismissMyKeyboard(){
     //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
     //In short- Dismiss the active keyboard.
     view.endEditing(true)
     }

    
}
