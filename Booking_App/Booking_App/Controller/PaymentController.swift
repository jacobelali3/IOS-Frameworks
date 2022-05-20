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
        var valid = true
        if cardNumber.isEmpty || cardNumber.range(of: #"^[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}$"#, options: .regularExpression) == nil {
            valid = false
            cardNumberError.isHidden = false
            blink(tf: cardNumberError)
        }
        if CVV.isEmpty || CVV.range(of: #"^[0-9]{3}$"#, options: .regularExpression) == nil {
            valid = false
            CVVError.isHidden = false
            blink(tf: CVVError)
        }
        if expiry.isEmpty || expiry.range(of: #"^(0[1-9]|1[0-2])/[0-9]{2}$"#, options: .regularExpression) == nil {
            valid = false
            expiryError.isHidden = false
            blink(tf: expiryError)
        }
        if postcode.isEmpty || postcode.range(of: #"[0-9]{4}"#, options: .regularExpression) == nil {
            valid = false
            postcodeError.isHidden = false
            blink(tf: postcodeError)
        }
        if name.isEmpty || name.range(of: #"[A-Z][a-z]+ [A-Z][a-z]+"#, options:.regularExpression) == nil {
            valid = false
            holderNameError.isHidden = false
            blink(tf: holderNameError)
        }
        
        if valid {
            print("All inputs valid, safe to proceed.")
        }
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
