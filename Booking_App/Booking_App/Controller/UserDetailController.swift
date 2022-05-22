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
    @IBOutlet weak var invalidInputLbl: UILabel!
    
    var booking: Booking = Booking();
    
    let alert = EmailAlert();
    
    //    var someUser : User = User()
    //etUserDate(_ day: Int,_ month: Int,_ year: Int,_ hour: Int,_ minute: Int){
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
        else{
            alert.showAlert(with: "Invalid Input", message: "Error! Invalid input! Check your name and email.", on: self)
            return false;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToPayment" {
            let VC = segue.destination as! PaymentController;
                VC.booking = self.booking;
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if confirm(){
            return true;
        }
        else{
            return false;
        }
    }
    
    
         
    let emailPattern = #"^\S+@\S+\.\S+$"#;
    let namePattern = #"[a-zA-Z]+"#;
    
    func emailIsValid(_ email: String) -> Bool{
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailPattern);
        return emailPredicate.evaluate(with: email);
    }
    
    func nameIsValid(_ name: String) -> Bool{
        let namePredicate = NSPredicate(format:"SELF MATCHES %@", namePattern);
        return namePredicate.evaluate(with: name);
    }

    
}
