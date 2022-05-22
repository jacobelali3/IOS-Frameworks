//
//  PaymentController.swift
//  Booking_App
//
//  Created by Kevin Yu on 18/5/2022.
//
import Foundation
import UIKit

class PaymentController: UIViewController {
    var booking: Booking = Booking()
    var valid: Bool = true
    
    @IBOutlet weak var cardNumberTF: UITextField!
    @IBOutlet weak var CVVTF: UITextField!
    @IBOutlet weak var expiryTF: UITextField!
    @IBOutlet weak var postcodeTF: UITextField!
    @IBOutlet weak var holderNameTF: UITextField!
    
    @IBOutlet weak var cardNumberError: UILabel!
    @IBOutlet weak var CVVError: UILabel!
    @IBOutlet weak var expiryError: UILabel!
    @IBOutlet weak var postcodeError: UILabel!
    @IBOutlet weak var holderNameError: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeHideKeyboard()
        cardNumberTF.placeholder = "0000 0000 0000 0000"
        CVVTF.placeholder = "000"
        expiryTF.placeholder = "MM/YY"
        postcodeTF.placeholder = "0000"
        holderNameTF.placeholder = "John Doe"
        hideErrors()
    }
    

    @IBAction func checkTFs(_ sender: UIButton) {
        hideErrors()
        let cardNumber = cardNumberTF.text!
        let CVV = CVVTF.text!
        let expiry = expiryTF.text!
        let postcode = postcodeTF.text!
        let name = holderNameTF.text!
        self.valid = true
        if cardNumber.isEmpty || cardNumber.range(of: #"^[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}$"#, options: .regularExpression) == nil {
            self.valid = false
            cardNumberError.isHidden = false
            blink(tf: cardNumberError)
        }
        if CVV.isEmpty || CVV.range(of: #"^[0-9]{3}$"#, options: .regularExpression) == nil {
            self.valid = false
            CVVError.isHidden = false
            blink(tf: CVVError)
        }
        if expiry.isEmpty || expiry.range(of: #"^(0[1-9]|1[0-2])/[0-9]{2}$"#, options: .regularExpression) == nil {
            self.valid = false
            expiryError.isHidden = false
            blink(tf: expiryError)
        }
        if postcode.isEmpty || postcode.range(of: #"[0-9]{4}"#, options: .regularExpression) == nil {
            self.valid = false
            postcodeError.isHidden = false
            blink(tf: postcodeError)
        }
        if name.isEmpty || name.range(of: #"[A-Z][a-z]+ [A-Z][a-z]+"#, options:.regularExpression) == nil {
            self.valid = false
            holderNameError.isHidden = false
            blink(tf: holderNameError)
        }
        
        if self.valid {
            self.booking.paymentDetails.cardNumber = cardNumber
            self.booking.paymentDetails.cvv = CVV
            self.booking.paymentDetails.expiry = expiry
            self.booking.paymentDetails.postCode = postcode
            self.booking.paymentDetails.cardHolderName = name
//            let nextViewController: EmailController = EmailController()
//            nextViewController.booking = self.booking
//            self.show(nextViewController, sender: self)
//            replaced with prepare()
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return self.valid
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEmail" {
            let VC = segue.destination as! EmailController
            VC.booking = self.booking
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
    
    func hideErrors() {
        cardNumberError.isHidden = true
        CVVError.isHidden = true
        expiryError.isHidden = true
        postcodeError.isHidden = true
        holderNameError.isHidden = true
    }
    
    func blink(tf: UILabel) {
        tf.alpha = 0.5
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveLinear, .autoreverse], animations: {
            tf.alpha = 1}, completion: nil
        )
    }
}
