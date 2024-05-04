//
//  ViewController.swift
//  appointmentcenter
//
//  Created by Olgun ‏‏‎‏‏‎ on 30.04.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toorandevuu", sender: nil)
    }
    @IBAction func randevularClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toRandevularimVC", sender: nil)
    }
    @IBAction func talepClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toTalepVC", sender: nil)
        
        
        
    }
    
    @IBAction func menuClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toMenuVC", sender: nil)
    }
}

