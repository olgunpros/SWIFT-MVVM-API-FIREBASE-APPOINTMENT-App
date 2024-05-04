//
//  passwordresetVC.swift
//  appointmentcenter
//
//  Created by Olgun ‏‏‎‏‏‎ on 30.04.2024.
//

import UIKit
import Firebase
import FirebaseAuth

class passwordresetVC: UIViewController {

    @IBOutlet var passwordTextt: UITextField!
    @IBOutlet var mailTextt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func sendClicked(_ sender: Any) {
        if mailTextt.text != nil && passwordTextt.text != nil {
            if mailTextt.text == passwordTextt.text {
                Auth.auth().sendPasswordReset(withEmail: mailTextt.text!)
                self.performSegue(withIdentifier: "toStartVC", sender: nil)
            }
            else {
                self.makeAlert(text: "Try Again")            }
        }
        self.makeAlert(text: "Try Again")        
    }
    
    
    func makeAlert(text : String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
        
        
    }
   
    


