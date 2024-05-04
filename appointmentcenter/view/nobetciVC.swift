//
//  nobetciVC.swift
//  appointmentcenter
//
//  Created by Olgun ‏‏‎‏‏‎ on 30.04.2024.
//

import UIKit
import RxSwift
import RxCocoa

class nobetciVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let pharmacyVM = PharmacyViewModel()
    var pharmacyList = [Pharmacy]()
    let disposeBag = DisposeBag()

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupBindings()
        pharmacyVM.requestData()

    }
    func setupBindings() {
        pharmacyVM.error.observe(on: MainScheduler.asyncInstance).subscribe { errorString in
            print(errorString)
        }.disposed(by: disposeBag)
        pharmacyVM.pharmacy.observe(on: MainScheduler.asyncInstance).subscribe { pharmacy in
            self.pharmacyList = pharmacy
            self.tableView.reloadData()
            
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = pharmacyList[indexPath.row].pharmacyName
        content.secondaryText = pharmacyList[indexPath.row].address
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pharmacyList.count    }
   
    
    
    
    

   

}
