//
//  randevuVC.swift
//  appointmentcenter
//
//  Created by Olgun ‏‏‎‏‏‎ on 30.04.2024.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestore

class randevuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var doktoradiArray = [String]()
    var bolumadiArray = [String]()
    var hastaneadiArray = [String]()
    var tarihArray = [String]()


    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        getdatafromfirestore()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bolumadiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! feedcell

               cell.doktoradiText.text! = doktoradiArray[indexPath.row]
               cell.bolumadiText.text! = bolumadiArray[indexPath.row]
               cell.hastaneadiText.text! = hastaneadiArray[indexPath.row]
               cell.tarihText.text = tarihArray[indexPath.row]
               return cell
    }
    func getdatafromfirestore() {
          let fireStoredatabase = Firestore.firestore()
          fireStoredatabase.collection("Randevularim").addSnapshotListener { snapshot, error in
              if error != nil {
                  print(error?.localizedDescription)
              }
              else {
                  if snapshot?.isEmpty != true {
                      for document in snapshot!.documents {
                          let documentID = document.documentID
                          
                          if let doktoradi = document.get("doktoradi") as? String {
                              self.doktoradiArray.append(doktoradi)
                          }
                          
                          if let bolumadi = document.get("bolumadi") as? String {
                              self.bolumadiArray.append(bolumadi)
                          }
                          if let hastane = document.get("hastaneadi") as? String {
                              self.hastaneadiArray.append(hastane)
                          }
                          if let tarih = document.get("tarih") as? String {
                              self.tarihArray.append(tarih)
                          }
                      }
                      self.tableView.reloadData()
                  }
              }
          }
      }
   
    


}
