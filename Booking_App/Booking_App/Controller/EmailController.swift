//
//  EmailController.swift
//  Booking_App
//
//  Created by Kevin Yu on 18/5/2022.
//

import Foundation
import UIKit
import SafariServices
import MessageUI


class EmailController: UIViewController,UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    var booking: Booking = Booking()
    var ticketMessage: String = " "
    var email: String = "someEmailToSendTo@gmail.com"
    let customAlert = EmailAlert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//           if segue.identifier == "goToGame" {
//               let VC = segue.destination as! HomeController
//
//           }
//    }

    @IBAction func didTapButton(){
      
        if MFMailComposeViewController.canSendMail(){
        let vc = MFMailComposeViewController()
        vc.delegate = self
        vc.setSubject("Booking Ticket")
        vc.setToRecipients([email])
        vc.setMessageBody("<h1>Your ticket information:</h1><br></br>" + "<p>" + ticketMessage + "</p><br></br><br></br><p>Team Baker airlines</p>", isHTML: true)
        present(vc, animated: true)
        }
        else{
         
            customAlert.showAlert(with: "Error", message: "iPhone does not have an email app installed (or is running as a simulator). Please ensure you have an email app installed.", on: self)
    
        }
        
    }
    
    @objc func dismissAlert(){
        customAlert.dismissAlert()
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
  

    
}
            class EmailAlert{
                struct Constants{
                static let backgroundAlphaTo: CGFloat = 0.6
                }
                
                private let backgroundView: UIView = {
                    let backgroundView = UIView()
                    backgroundView.backgroundColor = .black
                    backgroundView.alpha = 0
                    return backgroundView
                }()
                
                private let alertView: UIView = {
                    let alert = UIView()
                    alert.backgroundColor = .white
                    alert.layer.masksToBounds = true
                    alert.layer.cornerRadius = 12
                    return alert
                }()
                
                private var myTargetView: UIView?
                
                func showAlert(with title: String, message: String, on viewController: UIViewController){
                    guard let targetView = viewController.view else{
                        return
                    }
                    
                    myTargetView = targetView
                    
                    backgroundView.frame = targetView.bounds
                    targetView.addSubview(backgroundView)
                    targetView.addSubview(alertView)
                    alertView.frame = CGRect(x:40, y:-300, width:targetView.frame.size.width-80, height:300)
                    let titleLabel = UILabel(frame: CGRect(x:0, y: 0, width: alertView.frame.size.width, height: 80))
                    
                    titleLabel.text = title
                    titleLabel.textAlignment = .center
                    alertView.addSubview(titleLabel)
                    
                    let messageLabel = UILabel(frame: CGRect(x:0, y: 80, width: alertView.frame.size.width, height: 170))
                    messageLabel.numberOfLines = 0
                    messageLabel.text = message
                    messageLabel.textAlignment = .center
                
                    alertView.addSubview(messageLabel)
                    
                    let button = UIButton(frame: CGRect(x: 0, y: alertView.frame.size.height-50, width: alertView.frame.size.width, height: 50))
                    
                
                    button.setTitle("Dismiss", for: .normal)
                    button.setTitleColor(.link, for: .normal)
                    button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
                    alertView.addSubview(button )
                    UIView.animate(withDuration: 0.25, animations: {
                        self.backgroundView.alpha = Constants.backgroundAlphaTo
                    }, completion: {done in
                        if done{
                            UIView.animate(withDuration: 0.25, animations: {
                                self.alertView.center = targetView.center
                            })
                        }
                    })
                }
                
                @objc func dismissAlert(){
                    guard let targetView = myTargetView else{
                        return
                        
                    }
                    UIView.animate(withDuration: 0.25, animations: {
                        self.alertView.frame = CGRect(x:40, y: targetView.frame.size.height, width:targetView.frame.size.width-80, height:300)
                    }, completion: {done in
                        if done{
                            UIView.animate(withDuration: 0.25, animations: {
                                self.backgroundView.alpha = 0
                            }, completion: { done in
                                if done {
                                    self.alertView.removeFromSuperview()
                                    self.backgroundView.removeFromSuperview()
                                }
                                
                            })
                        }
                    })
                }
            }
