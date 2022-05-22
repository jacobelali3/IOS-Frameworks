//
//  UserDetailController.swift
//  Booking_App
//
//  Created by Kevin Yu on 18/5/2022.
//

import Foundation
import UIKit

class UserDetailController: UIViewController {

    @IBOutlet weak var firstNameTf: UITextField!
    @IBOutlet weak var lastNameTf: UITextField!
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!

    var booking: Booking = Booking();
        
        let alert = EmailAlert();
        
        //    var someUser : User = User()
        //etUserDate(_ day: Int,_ month: Int,_ year: Int,_ hour: Int,_ minute: Int){
        override func viewDidLoad() {
            super.viewDidLoad()
            initializeHideKeyboard()
        }
        
        //Regex check input, if valid save data, else throw error message to user:
        @objc func confirm() -> Bool{
            if(emailIsValid(emailTf.text!) && nameIsValid(firstNameTf.text!) && nameIsValid(lastNameTf.text!)){
                //Set user firstName:
                booking.userDetails.firstName = firstNameTf.text!;
                
                //Set user lastName:
                booking.userDetails.lastName = lastNameTf.text!;
                
                //set user email:
                booking.userDetails.email = emailTf.text!;
                
                return true;
            }
            //Send error message if input is invalid:
            else{
                alert.showAlert(with: "Invalid Input", message: "Error! Invalid input! Check your name and email.", on: self)
                return false;
            }
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
     
        //Send data to next viewController:
        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            if segue.identifier == "goToPayment" {
                let VC = segue.destination as! PaymentController;
                    VC.booking = self.booking;
            }
        }
        
        //Override perform segue function for regex checking:
        override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            if confirm(){
                return true;
            }
            else{
                return false;
            }
        }
        
        
        //Regular Expressions logic;
        let emailPattern = #"^\S+@\S+\.\S+$"#;
        let namePattern = #"[a-zA-Z]+"#;
        
        //Check email validity:
        func emailIsValid(_ email: String) -> Bool{
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailPattern);
            return emailPredicate.evaluate(with: email);
        }
        
        //Check name validity:
        func nameIsValid(_ name: String) -> Bool{
            let namePredicate = NSPredicate(format:"SELF MATCHES %@", namePattern);
            return namePredicate.evaluate(with: name);
        }

        
    }
