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
    @IBOutlet weak var surnameTf: UITextField!
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    var booking : Booking = Booking();
    
    //    var someUser : User = User()
    //etUserDate(_ day: Int,_ month: Int,_ year: Int,_ hour: Int,_ minute: Int){
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func confirmBtn(_ sender: Any) {
        
        if(emailIsValid(emailTf.text!) && nameIsValid(firstNameTf.text!) && nameIsValid(surnameTf.text!)){
//            Save First Name to userModel;
            booking.user.firstName = firstNameTf.text!;
            print(booking.user.firstName);
            
//            Sace last Name to userModel;
            booking.user.surname = surnameTf.text!;
            print(booking.user.surname);
            
//            Save emailAddress to userModel;
            booking.user.email = emailTf.text!;
            print(booking.user.email);
            
//            Go to next screen;
            
        }
        else{
//            Change label "invalid email address"
            print("regex works!!!");
            
        }
    }
    
    let emailPattern = #"^\S+@\S+\.\S+$"#;
    let namePattern = #"[a-zA-Z]+"#;
    
    func emailIsValid(_ email: String) -> Bool{
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailPattern);
        return emailPredicate.evaluate(with: email);
    }
    
    func nameIsValid(_ name: String) -> Bool{
        let namePredicate = NSPredicate(format:"SELF MATCHES%@", namePattern);
        return namePredicate.evaluate(with: name)
    }
    
    
    
    
}
