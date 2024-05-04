//
//  startVC.swift
//  appointmentcenter
//
//  Created by Olgun ‏‏‎‏‏‎ on 30.04.2024.
//

import UIKit
import Firebase
import FirebaseAuth


class startVC: UIViewController {
    @IBOutlet var mailText: UITextField!
    
    @IBOutlet var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func switchClicked(_ sender: UISwitch) {
        if sender.isOn {
            if Auth.auth().currentUser != nil {
                self.performSegue(withIdentifier: "toViewVC", sender: nil)
            }
        }
        else {
            
        }
        
        
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        if mailText.text != nil && passwordText.text != nil {
            Auth.auth().signIn(withEmail:mailText.text!, password: passwordText.text!) { result, error in
                if error != nil {
                    self.makeAlert(text: error!.localizedDescription)
                }
                else {
                    self.performSegue(withIdentifier: "toViewVC", sender: nil)
                }
            }
            
        }
        
    }
    
    @IBAction func signinClicked(_ sender: Any) {
        Auth.auth().createUser(withEmail: mailText.text!, password: passwordText.text!) { result, error in
            if error != nil {
                self.makeAlert(text: error!.localizedDescription)
            }
            else {
                self.performSegue(withIdentifier: "toSigninVC", sender: nil)
            }
        }
    }
    
    @IBAction func resetClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toResetVC", sender: nil)
        
        
        
        
        
    }
    func makeAlert(text : String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
}
