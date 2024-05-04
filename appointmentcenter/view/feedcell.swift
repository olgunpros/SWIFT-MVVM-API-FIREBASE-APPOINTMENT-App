//
//  feedcell.swift
//  appointmentcenter
//
//  Created by Olgun ‏‏‎‏‏‎ on 3.05.2024.
//

import UIKit

class feedcell: UITableViewCell {
    @IBOutlet var doktoradiText: UILabel!
    @IBOutlet var bolumadiText: UILabel!
    @IBOutlet var tarihText: UILabel!
    
    @IBOutlet var hastaneadiText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
