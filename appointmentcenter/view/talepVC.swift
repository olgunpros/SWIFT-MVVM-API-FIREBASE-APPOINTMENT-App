//
//  talepVC.swift
//  appointmentcenter
//
//  Created by Olgun ‏‏‎‏‏‎ on 30.04.2024.
//

import UIKit
import Firebase
import FirebaseStorage

class talepVC: UIViewController {
    

    @IBOutlet var talepadiText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func senddClicked(_ sender: Any) {
        let storage = Storage.storage()
               let firestoreDatabase = Firestore.firestore()
               var firestorereference : DocumentReference? = nil
               let firestorePost = ["talepadi": self.talepadiText.text!] as [String : Any]
               firestorereference = firestoreDatabase.collection("Taleplerim").addDocument(data: firestorePost, completion: { error in
                   if error != nil {
                       print("Error")
                   }
                   else {
                       self.performSegue(withIdentifier: "toSuccesVC", sender: nil)
                   }
                  
               })
           }
    }
    
   


