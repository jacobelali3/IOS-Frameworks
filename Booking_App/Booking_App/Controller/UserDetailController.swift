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
    
    let emailPattern = #"^\S+@\S+\.\S+$"#;
    
    
    //    var someUser : User = User()
    //etUserDate(_ day: Int,_ month: Int,_ year: Int,_ hour: Int,_ minute: Int){
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //grab user object: let user = Booking.getUser();
        
    }
    
    @IBAction func confirmBtn(_ sender: Any) {
        var validEmail = emailTf.text?.range(
            of: emailPattern,
            options: .regularExpression)
        
        if(validEmail != nil){
            //Save First Name to userModel;
            //user.setName(firstNameTf.text);
            
            //Sace last Name to userModel;
            
            //Save emailAddress to userModel;
            
            //Go to next screen;
        }
        else{
            //Change label "invalid email address"
        }
    }
    
    
    
    
}
