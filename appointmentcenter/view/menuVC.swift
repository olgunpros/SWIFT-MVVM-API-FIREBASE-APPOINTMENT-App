//
//  menuVC.swift
//  appointmentcenter
//
//  Created by Olgun ‏‏‎‏‏‎ on 30.04.2024.
//

import UIKit
import Firebase
import FirebaseAuth

class menuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func nobetciClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toNobetciVC", sender: nil)
    }
    @IBAction func signoutClicked(_ sender: Any) {
        try? Auth.auth().signOut()
        self.performSegue(withIdentifier: "toCikisyapildiVC", sender: nil)
    }
    
    

}
